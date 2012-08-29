<cfcomponent extends="Model">
	<cffunction name="init">
		<cfset table("ce_Activity")>
		<cfset property(name="id", column="ActivityID") />
		<cfset afterSave("generateCode")>
		
		<!---
		<cfset setPrimaryKey(property="id") />
		--->
	</cffunction>
	
	<cffunction name="generateCode">
		<cfset var loc = {} />
		
		<cfif len(trim(this.code)) LTE 0>
			<cfset loc.code = FormatBaseN(this.id & dateFormat(this.created,'mmddyyyy'),36) />
			
			<cfset this.updateProperty("code",loc.code) />
		</cfif>
	</cffunction>
</cfcomponent>
