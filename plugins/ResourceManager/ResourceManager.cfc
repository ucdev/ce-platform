<cfcomponent output="false">
	<cffunction name="init">
		<cfset this.version = "1.0.5">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="resource" hint="I load all cached pagelet resources.">
		<cfargument name="type" required="true" />
		<cfargument name="name" required="true" />
		
		<cfset var loc = {} />
		<cfset loc.filepath = "" />
		<cfset loc.httppath = "" />
		
		<cfswitch expression="#arguments.type#">
			<cfcase value="controllerJs">
				<cfset loc.filepath = "/javascripts/#application.version_token#/app/controllers/#arguments.name#.js" />
			</cfcase>
			<cfcase value="viewJs">
				<cfif NOT directoryExists(expandPath("/javascripts/#application.version_token#/app/views/#lcase(params.controller)#"))>
					<cfdirectory action="create" directory="#expandPath("/javascripts/#application.version_token#/app/views/#lcase(params.controller)#")#">
				</cfif>
				<cfset loc.filepath = "/javascripts/#application.version_token#/app/views/#lcase(params.controller)#/#arguments.name#.js" />
			</cfcase>
		</cfswitch>
		
		<cfif NOT fileExists(loc.filepath)>
			<cffile action="write" file="#loc.filepath#" output="" charset="utf-8"  />
		</cfif>
		
		<cfreturn loc.httppath />
	</cffunction>
	
	<cffunction name="$writeLessFile">
	</cffunction>
	
	<cffunction name="$writeJsFile">
		<cfsavecontent variable="loc.output">
		
		</cfsavecontent>
	</cffunction>
	
	<cffunction name="$writeToCache">
	
	</cffunction>
	
	<cffunction name="$loadCss()">
	
	</cffunction>
	
	<cffunction name="$loadPagelet()">
	
	</cffunction>
</cfcomponent>