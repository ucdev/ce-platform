<cfcomponent displayname="API">
	<cffunction name="RegisterAuth" access="remote" output="no">
		<cfargument name="uname" required="yes" type="string" />
		<cfargument name="pword" required="yes" type="string" />
		
		<cfset var ReturnOutput = "">
		
		<cfinvoke 
		   webservice="#Application.Settings.LoginService#"
		   method="authenticate"
		   datasource="cmeRWprod"
		   uname="#arguments.uname#"
		   passwd="#arguments.pword#"
		   institutionid="1"
		   returnVariable = "ReturnVar">
		<cfset Session.PersonID = ReturnVar[2]>
		
		<cfif Session.PersonID NEQ "">
			<cfset Session.LoggedIn = true>
			<cfset Session.Person = CreateObject("component","#Application.Settings.Com#Person.Person").init(PersonID=Session.PersonID)>
			<cfset Session.Person = Application.Com.PersonDAO.Read(Session.Person)>
			
			<!--- GET ADDRESS --->
			<cfquery name="qAddress" datasource="#Application.Settings.DSN#">
				SELECT     Phone1, streetline1, streetline2, city, stateid, postalcode, countryid
				FROM         dbo.ce_address
				WHERE     (personid = #Session.PersonID#) AND (addresstypeid = 2)
				ORDER BY LastUpdate DESC
			</cfquery>
			
			<cfsavecontent variable="ReturnOutput"><cfoutput>success|#Session.PersonID#|#Session.Person.getFirstName()#|#Session.Person.getMiddleName()#|#Session.Person.getLastName()#|#DateFormat(Session.Person.getBirthdate(),'mm/dd/yyyy')#|#Session.Person.getSSN()#|#Session.Person.getEmail1()#|#qAddress.Phone1#|#qAddress.streetline1#|#qAddress.streetline2#|#qAddress.city#|#qAddress.stateid#|#qAddress.PostalCode#|#qAddress.CountryID#</cfoutput></cfsavecontent>
			
			<cfcookie name="Person.FirstName" value="#Session.Person.getFirstName()#">

		<cfelse>
			<cfsavecontent variable="ReturnOutput">fail|</cfsavecontent>
		</cfif>
		
		<cfreturn ReturnOutput />
	</cffunction>
</cfcomponent>