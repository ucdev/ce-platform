<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Person_Email")>
        <cfset property(name="id", column="email_id") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	
	<cffunction name="isLogginable">
		<cfif this.allow_login is "1">
			<cfreturn false>
		<cfelse>
			<cfreturn true>
		</cfif>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	
	<cffunction name="isVerified">
		<cfif this.is_verified is "1">
			<cfreturn false>
		<cfelse>
			<cfreturn true>
		</cfif>
	</cffunction>
</cfcomponent>
