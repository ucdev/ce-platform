<cfcomponent output="false">
	<cffunction name="init">
		<cfset this.version = "1.0.5">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="resources" hint="I load all cached pagelet resources.">
		<cfset var loc = {} />
		<cfset loc.filepath = "" />
		<cfset loc.httppath = "" />
		
		<!--- BUILD CONTROLLER JS --->
		<cfset loc.controllerJs = "/javascripts/#application.version_token#/app/controllers/#lcase(params.controller)#.js" />
		
		<cfif NOT fileExists(loc.controllerJs)>
			<cffile action="write" file="#loc.controllerJs#" output="" charset="utf-8"  />
		</cfif>
		
		<!--- BUILD VIEW JS --->
		<cfif NOT directoryExists(expandPath("/javascripts/#application.version_token#/app/views/#lcase(params.controller)#"))>
			<cfdirectory action="create" directory="#expandPath("/javascripts/#application.version_token#/app/views/#lcase(params.controller)#")#">
		</cfif>
		<cfset loc.viewJs = "/javascripts/#application.version_token#/app/views/#lcase(params.controller)#/#lcase(params.action)#.js" />
		
		<cfif NOT fileExists(loc.viewJs)>
			<cffile action="write" file="#loc.viewJs#" output="" charset="utf-8"  />
		</cfif>
		
		<!--- BUILD MODEL JS --->
		<cfset loc.modelJs = "/javascripts/#application.version_token#/app/models/#lcase(singularize(params.action))#.js" />
		
		<cfif NOT fileExists(loc.modelJs)>
			<cffile action="write" file="#loc.modelJs#" output="" charset="utf-8"  />
		</cfif>
		
		<!---
		<cfif NOT directoryExists(expandPath("/javascripts/#application.version_token#/app/views/#lcase(params.controller)#"))>
			<cfdirectory action="create" directory="#expandPath("/javascripts/#application.version_token#/app/views/#lcase(params.controller)#")#">
		</cfif>
		
		<cfset loc.filepath = "/javascripts/#application.version_token#/app/views/#lcase(params.controller)#/#arguments.name#.js" />
		
		<cfif NOT fileExists(loc.filepath)>
			<cffile action="write" file="#loc.filepath#" output="" charset="utf-8"  />
		</cfif>--->
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