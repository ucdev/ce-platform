<cfcomponent displayname="Renderer">
	<cffunction name="init" displayname="Instantiates a Renderer object" returntype="Renderer" access="public">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="showPod" displayname="Displays a Pod" returntype="string" access="public">
		<cfargument name="PodName" type="string" required="yes" hint="File name without the extension">
		
		<cfset var Body = "">
		
		<cfsavecontent variable="Body">
			<cfoutput>
					<cfinclude template="/_pods/#PodName#.cfm" />
			</cfoutput>
		</cfsavecontent>
		
		<cfreturn Body />
	</cffunction>
</cfcomponent>