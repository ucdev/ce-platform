<cfcomponent displayname="Person Ajax" output="no">
	<cfset myself = Request.Myself>
	
	<cffunction name="API" access="remote" output="no">
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
				SELECT     Phone1, Address1, Address2, City, State, ZipCode, Country
				FROM         dbo.ce_Person_Address
				WHERE     (personid = #session.currentuser.id#) AND (AddressTypeID = 2)
				ORDER BY UpdatedBy DESC
			</cfquery>
			
			<cfsavecontent variable="ReturnOutput"><cfoutput>success|#session.currentuser.id#|#session.currentuser.FirstName#|#session.currentuser.MiddleName#|#session.currentuser.LastName#|#DateFormat(session.currentuser.Birthdate,'mm/dd/yyyy')#|#session.currentuser.SSN#|#session.currentuser.Email1#|#qAddress.Phone1#|#qAddress.Address1#|#qAddress.Address2#|#qAddress.City#|#qAddress.State#|#qAddress.ZipeCode#|#qAddress.Country#</cfoutput></cfsavecontent>
			
			<cfcookie name="Person.FirstName" value="#session.currentuser.FirstName#">

		<cfelse>
			<cfsavecontent variable="ReturnOutput">fail|</cfsavecontent>
		</cfif>
		
		<cfreturn ReturnOutput />
	</cffunction>
</cfcomponent>