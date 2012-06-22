<cfcomponent output="false">
	<cffunction name="init">
		<cfset this.version = "1.0.5">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="resource" hint="I load all cached pagelet resources.">
		<cfargument name="location" required="true" />
		
		<cfparam name="params.pagelet" default="" />
		<cfparam name="params.pagelet_token" default="" />
		
		
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