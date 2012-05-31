<cfcomponent displayname="Indexer">
	<cffunction name="People" access="remote">
		<!--- Retrieve data from the table. --->
		<cfquery name="getPeople" datasource="#Application.Settings.DSN#">
			SELECT PersonID,FirstName,MiddleName,LastName,EmailSSN,CONVERT(varchar,Birthdate,101) As Birthdate, UCID
			FROM ce_Person
		</cfquery>
		
		<!--- Update the collection with the above query results. --->
		<cfindex 
			query="getPeople"
			collection="personindex"
			action="Update"
			type="Custom"
			key="PersonID"
			title="PersonID"
			body="FirstName,MiddleName,LastName,Email1,Email2,Email3,SSN,Birthdate,UCID"
			Custom1="FirstName"
			Custom2="LastName"
			Custom3="SSN"
			Custom4="Birthdate">
	</cffunction>
</cfcomponent>