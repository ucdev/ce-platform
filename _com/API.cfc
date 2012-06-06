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
		<cfset session.currentuser.id = ReturnVar[2]>
		
		<cfif session.currentuser.id NEQ "">
			<cfset Session.LoggedIn = true>
			<cfset Session.Person = CreateObject("component","#Application.Settings.Com#Person.Person").init(PersonID=session.currentuser.id)>
			<cfset Session.Person = Application.Com.PersonDAO.Read(Session.Person)>
			
			<!--- GET ADDRESS --->
			<cfquery name="qAddress" datasource="#Application.Settings.DSN#">
				SELECT     Phone1, streetline1, streetline2, city, stateid, postalcode, countryid
				FROM         dbo.ce_address
				WHERE     (personid = #session.currentuser.id#) AND (addresstypeid = 2)
				ORDER BY LastUpdate DESC
			</cfquery>
			
			<cfsavecontent variable="ReturnOutput"><cfoutput>success|#session.currentuser.id#|#session.currentuser.FirstName#|#session.currentuser.MiddleName#|#session.currentuser.LastName#|#DateFormat(session.currentuser.Birthdate,'mm/dd/yyyy')#|#session.currentuser.SSN#|#session.currentuser.Email1#|#qAddress.Phone1#|#qAddress.streetline1#|#qAddress.streetline2#|#qAddress.city#|#qAddress.stateid#|#qAddress.PostalCode#|#qAddress.CountryID#</cfoutput></cfsavecontent>
			
			<cfcookie name="Person.FirstName" value="#session.currentuser.FirstName#">

		<cfelse>
			<cfsavecontent variable="ReturnOutput">fail|</cfsavecontent>
		</cfif>
		
		<cfreturn ReturnOutput />
	</cffunction>
</cfcomponent>