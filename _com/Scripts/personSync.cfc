<cfcomponent displayname="Person Sync" output="no">
	<cffunction name="Run" output="yes" access="remote" returntype="string" returnformat="plain">
		<cfargument name="Start" type="numeric" required="no" default="0">
		<cfargument name="Rows" type="numeric" required="no" default="200">
		
		<cfquery name="qQuery" datasource="AITL-SQL1C">
			DECLARE @TopCount int
			DECLARE @CurrNumber int
			SET @TopCount = #Arguments.Rows#
			SET @CurrNumber = #Arguments.Start#;
			
			WITH CTE_Persons (PersonID)
			AS
			(
			SELECT 
				DISTINCT
				TOP (@TopCount)
				
				P.PersonID
			FROM 
				ce_Attendee AS Att INNER JOIN
				dbo.pd_person AS P ON Att.PersonID = P.personid 
				LEFT JOIN
				ce_Activity AS Act ON Act.ActivityID=Att.ActivityID
				LEFT JOIN
				dbo.pd_Salutation AS Prefix ON P.SalutationId = Prefix.SalutationId LEFT OUTER JOIN
				dbo.cs_user AS U ON Att.PersonID = U.personid
			WHERE Att.DeletedFlag='N' AND Act.DeletedFlag='N' AND 
				Att.PersonID NOT IN (
					SELECT DISTINCT TOP (@CurrNumber) P.PersonID
					FROM 
						ce_Attendee AS Att INNER JOIN
						dbo.pd_person AS P ON Att.PersonID = P.personid 
						LEFT JOIN
						ce_Activity AS Act ON Act.ActivityID=Att.ActivityID
						LEFT JOIN
						dbo.pd_Salutation AS Prefix ON P.SalutationId = Prefix.SalutationId LEFT OUTER JOIN
						dbo.cs_user AS U ON Att.PersonID = U.personid
					WHERE Att.DeletedFlag='N' AND Act.DeletedFlag='N'
					ORDER BY PersonID)
			ORDER BY PersonID
			)
			SELECT 
				P.PersonID,
				Prefix = Prefix.Code, 
				FirstName = P.firstname, 
				MiddleName = P.middlename, 
				LastName = P.lastname, 
				Suffix = P.namesuffix, 
				P.EthnicityID, 
				Email = P.Email1, 
				EmailAlt = P.Email2, 
				Username = U.username, 
				Password = U.password, 
				U.UCFlag, 
				Created = P.CreationDate
			FROM 
				CTE_Persons AS Att INNER JOIN
				dbo.pd_person AS P ON Att.PersonID = P.personid 
				LEFT JOIN
				dbo.pd_Salutation AS Prefix ON P.SalutationId = Prefix.SalutationId LEFT OUTER JOIN
				dbo.cs_user AS U ON Att.PersonID = U.personid
		</cfquery>
		
		
		
		<cfif qQuery.RecordCount GT 0>
			<cfloop query="qQuery">
				<cfset createPerson()>
			</cfloop>
			<script>window.location='#Application.Settings.RootPath#/_com/Scripts/personSync.cfc?method=Run&Start=#Arguments.Start+Arguments.Rows+1#&Rows=#Arguments.Rows#';</script>
		<cfelse>
			Attendees Complete!
			
			<cfquery name="qQuery" datasource="AITL-SQL1C">
				SELECT 
					P.PersonID,
					Prefix = Prefix.Code, 
					FirstName = P.firstname, 
					MiddleName = P.middlename, 
					LastName = P.lastname, 
					Suffix = P.namesuffix, 
					P.EthnicityID, 
					Email = P.Email1, 
					EmailAlt = P.Email2, 
					Username = U.username, 
					Password = U.password, 
					U.UCFlag, 
					Created = P.CreationDate
				FROM 
					ce_Account AS Att INNER JOIN
					dbo.pd_person AS P ON Att.PersonID = P.personid 
					LEFT JOIN
					dbo.pd_Salutation AS Prefix ON P.SalutationId = Prefix.SalutationId LEFT OUTER JOIN
					dbo.cs_user AS U ON Att.PersonID = U.personid
			</cfquery>
			
			<cfif qQuery.RecordCount GT 0>
				<cfloop query="qQuery">
					<cfset createPerson()>
				</cfloop>
			<cfelse>
				Accounts Complete!
			</cfif>
		</cfif>
	</cffunction>
	
	<cffunction name="createPerson" access="private" output="yes">
		<cfset Person = createobject("component","#Application.Settings.Com#Person.Person").init()>
		<cfset Person.setPersonID(qQuery.PersonID)>
		<cfset Person.setCreatedBy(1)>
		
		<cfif Application.Com.PersonDAO.Exists(Person)>
			<cfset Person = Application.Com.PersonDAO.Read(Person)>
			<cfset Person.setUpdatedBy(1)>
			<cfset Person.setUpdated(now())>
		</cfif>
		
		<cfset Person.setPrefix(qQuery.Prefix)>
		<cfset Person.setFirstName(qQuery.FirstName)>
		<cfset Person.setMiddleName(qQuery.MiddleName)>
		<cfset Person.setLastName(qQuery.LastName)>
		<cfset Person.setSuffix(qQuery.Suffix)>
		<cfset Person.setEthnicityID(qQuery.EthnicityID)>
		<cfset Person.setEmail(qQuery.Email)>
		<cfset Person.setPassword(qQuery.Password)>
		
		[#Person.getPersonID()#] #Person.getLastName()#, #Person.getFirstName()#<br>
		
		<cfif Application.Com.PersonDAO.Exists(Person)>			
			<cfset Application.Com.PersonDAO.Save(Person)>
		<cfelse>
			<cfset Application.Com.PersonDAO.CreateIDins(Person)>
		</cfif>
	</cffunction>
</cfcomponent>