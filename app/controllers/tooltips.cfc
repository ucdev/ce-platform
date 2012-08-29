<cfcomponent extends="controller">

	<cffunction name="person">
		<cfparam name="params.key" default="0" />
		
		<cfset person = model("person").findByKey(params.key) />
		
		<cfset renderPage(layout=false,hideDebugInformation=true) />
	</cffunction>
	
</cfcomponent>

