<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Person")>
        <cfset property(name="id", column="PersonID") />
        <!---<cfset setPrimaryKey(property="id") />--->
        
        <cfset hasMany("person_email")>
    </cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	
	<cffunction name="isActive">
		<cfif this.deletedFlag is "Y">
			<cfreturn false>
		<cfelse>
			<cfreturn true>
		</cfif>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	
	<cffunction name="isPassword">
		<cfargument name="password" type="string" required="yes">
		<cfreturn (compare(arguments.password, this.password) EQ 0) />
	</cffunction>
</cfcomponent>
