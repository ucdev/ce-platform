<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Account")>
        <cfset property(name="id", column="AccountID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
	
	<cffunction name="isAdmin">
		<cfif listContains('2,3',this.authorityId,',') GT 0>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>
</cfcomponent>
