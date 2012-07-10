<cfcomponent extends="Controller" output="false">
	
	<cffunction name="add">
		<cflock
			name="messageQueue"
			type="exclusive"
			timeout="5">
			 
			<!--- Create the message. --->
			 
			<!--- Add a message to the collection. --->
			<cfset arrayAppend( application.messages, params.message ) />
			 
			<!--- Output the message - for debugging purposes only. --->
			<cfoutput>
			#params.message#
			</cfoutput>
			 <cfabort>
		</cflock>
	</cffunction>
	
	<!--- activity_comments/index --->
	<cffunction name="pull">
		<!---
			Set a larger request timeout so we can keep the long polling
			going, which will allow us to send on-demand data down to the
			user over the wire.
		--->
		<cfsetting
			requesttimeout="#(60 * 1)#"
			enablecfoutputonly="true"
			/>
		 
		 
		<!---
			At some point this long-poll page is going to timeout. Wrap it
			in a try/catch so we can cleanly handle that timeout.
		--->
		<cftry>
		 
			<!---
				Just start looping indefinitely. This will allow us to
				periodically check to see if information needs to be flushed
				to the client.
			--->
			<cfloop condition="true">
		 
				<!---
					Lock access to our message queue since we are clearing
					it here and adding to it on another page. I want to make
					sure I don't get some odd race condition.
				--->
				<cflock
					name="messageQueue"
					type="exclusive"
					timeout="5">
		 
					<!---
						Check to see if we have any messages that have yet
						to be flushed to the client.
					--->
					<cfif arrayLen( application.messages )>
		 
						<!---
							Output the serialized data to the client. Be sure
							to include are data chunk delimiter so the client
							knows how to parse valid JSON packets.
						--->
						<cfoutput>
							#serializeJSON( application.messages )#
						</cfoutput>
		 
						<!---
							Clear the message queue so we don't flush
							duplicate entries to the client.
						--->
						<cfset application.messages = [] />
		 
					</cfif>
		 
					<!---
						Add a line break so we always have something to
						flush to the client.
					--->
					<cfoutput>::DATA::#chr( 13 )##chr( 10 )#</cfoutput>
		 
					<!--- Flush the content to the client. --->
					<cfflush interval="1" />
		 
				</cflock>
		 
		 
				<!---
					Allow the thread to sleep for a moment so we don't
					constantly hammer the client with flushing. Alos, this
					gives the server a small rest and provides an opportunity
					for data to actually change on the server.
				--->
				<cfthread action="sleep" duration="250" />
		 
			</cfloop>
		 
		 
			<!--- Catch the page timeout. --->
			<cfcatch>
		 
				<!---
					Simply abort - there's nothing that we can do at this
					point. The client will have to make a subsequent request
					for another long-poll connection.
				--->
				<cfabort />
		 
			</cfcatch>
		 
		</cftry>
	</cffunction>
	
</cfcomponent>
