<cfcomponent extends="controller">
	<cffunction name="init">
		<cfset filters(through="ajaxLoginRequired")>
		<cfset filters(through="ajaxAdminRequired")>
	</cffunction>
	
	<cffunction name="previewemail"  output="no">
		<cfparam name="params.style_id" type="numeric"  />
		
		<cfset request.email = createObject("component","_com.email").init() />
		<cfset request.myself = "" />
		<cfset request.email.Send(
						EmailStyleID=params.style_id,
						ToPersonID=169841,
						ToActivityID=12290,
						ToCreditID=1
						) />
						
		
		<cfset renderText(true) />
	</cffunction>
</cfcomponent>