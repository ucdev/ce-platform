<cfcomponent extends="Model">
    <cffunction name="init">
		<cfset table("ce_Person")>
		<cfset property(name="id", column="PersonID") />
		<!---<cfset setPrimaryKey(property="id") />--->
		
		<cfset hasMany("person_email")>
		<cfset hasOne("account") />
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
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	
	<cffunction name="findByMobile">
		<cfargument name="phonenumber" type="string" required="yes">
		
		<cfquery name="qAddr" datasource="#get('dataSourceName')#">
			SELECT TOP 1 personId
			FROM ce_person_address
			WHERE <cfqueryparam value="#arguments.phonenumber#" cfsqltype="cf_sql_varchar" /> IN (phone1,phone2,phone3)
		</cfquery>
		
		<cfif qAddr.recordCount GT 0>
			<cfreturn model("person").findByKey(qAddr.personId) />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>
</cfcomponent>
