<cfcomponent extends="controller">
	<cffunction name="previewEmail"  output="no" returntype="boolean">
		<cfparam name="params.style_id" type="numeric" required="yes" />
		
		<cfset request.email = createObject("component","_com.email").init() />
		<cfset request.myself = "" />
		<cfset request.email.Send(
						EmailStyleID=arguments.style_id,
						ToPersonID=session.personId,
						ToActivityID=12290,
						ToCreditID=1
						) />
						
		
		<cfreturn true />
	</cffunction>
</cfcomponent>