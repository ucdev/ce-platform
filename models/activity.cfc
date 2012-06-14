<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Activity")>
        <cfset property(name="id", column="ActivityID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
	
	<cffunction name="findByCode">
		<cfreturn model("activity").findOne(where="dbo.fn_decToBase(#arguments.code#,'16') = id") />
	</cffunction>
</cfcomponent>
