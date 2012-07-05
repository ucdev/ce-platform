<cfcomponent output="false" mixin="controller">

	<cffunction name="init" access="public" output="false">
		<cfset this.version = "1.0,1.1,1.1.1,1.1.2,1.1.3">		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="renderMustache">
		<cfscript>
			var mustache = createObject("component", "Mustache");
			return mustache.render(arguments.template, arguments.data);
		</cfscript>
	</cffunction>
	
</cfcomponent>