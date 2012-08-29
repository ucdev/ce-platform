<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("credit_requests")>
		<cfset validatesUniquenessOf(property="recordHash",message="Invalid request. We already have your attendance logged for this event.") />
		<cfset beforeCreate("createSid") />
		<!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>

    <cffunction name"createSid">
    	<cfset stringKey = dateFormat(now(),'mmddyyyy') & timeFormat(now(),"hhmmss")
    	<cfset this.sessionid = lcase(hash(stringKey,"MD5")) />
	</cffunction>
</cfcomponent>
