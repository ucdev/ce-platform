<cfcomponent output="false">
	<cffunction name="init">
		<cfset this.version = "1.0.5">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="resource" hint="I load all cached pagelet resources.">
		<cfargument name="type" required="true" />
		<cfargument name="src" required="true" />
		
		<cfset var loc = {} />
		<cfset loc.filepath = expandPath("/javascripts#params.src#") />
		<cfset loc.httppath = "/javascripts#params.src#" />
		
		<cfif NOT fileExists(loc.filepath)>
			<cffile action="write" file="#loc.filepath#" />
		</cfif>
		
		<cfreturn arguments.httppath />
	</cffunction>
	
	<cffunction name="$writeLessFile">
		<cfsavecontent variable="loc.output">
		
		</cfsavecontent>
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