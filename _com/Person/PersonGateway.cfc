
<cfcomponent displayname="PersonGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.Person.PersonGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="Prefix" type="string" required="false" />
		<cfargument name="FirstName" type="string" required="false" />
		<cfargument name="MiddleName" type="string" required="false" />
		<cfargument name="LastName" type="string" required="false" />
		<cfargument name="Suffix" type="string" required="false" />
		<cfargument name="CertName" type="string" required="false" />
		<cfargument name="DisplayName" type="string" required="false" />
		<cfargument name="EthnicityID" type="numeric" required="false" />
		<cfargument name="OMBEthnicityID" type="numeric" required="false" />
		<cfargument name="Email" type="string" required="false" />
		<cfargument name="Password" type="string" required="false" />
		<cfargument name="PrimaryAddressID" type="numeric" required="false" />
		<cfargument name="Birthdate" type="date" required="false" />
		<cfargument name="SSN" type="numeric" required="false" />
		<cfargument name="Gender" type="string" required="false" />
		<cfargument name="StatusID" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="DeletedBy" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				PersonID,
				Prefix,
				FirstName,
				MiddleName,
				LastName,
				Suffix,
				CertName,
				DisplayName,
				EthnicityID,
				OMBEthnicityID,
				Email,
				Password,
				PrimaryAddressID,
				Birthdate,
				SSN,
				Gender,
				StatusID,
				Created,
				CreatedBy,
				Updated,
				UpdatedBy,
				Deleted,
				DeletedFlag,
				DeletedBy
			FROM	ce_Person
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Prefix") and len(arguments.Prefix)>
			AND	Prefix = <cfqueryparam value="#arguments.Prefix#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FirstName") and len(arguments.FirstName)>
			AND	FirstName = <cfqueryparam value="#arguments.FirstName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"MiddleName") and len(arguments.MiddleName)>
			AND	MiddleName = <cfqueryparam value="#arguments.MiddleName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"LastName") and len(arguments.LastName)>
			AND	LastName = <cfqueryparam value="#arguments.LastName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Suffix") and len(arguments.Suffix)>
			AND	Suffix = <cfqueryparam value="#arguments.Suffix#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"CertName") and len(arguments.CertName)>
			AND	CertName = <cfqueryparam value="#arguments.CertName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"DisplayName") and len(arguments.DisplayName)>
			AND	DisplayName = <cfqueryparam value="#arguments.DisplayName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"EthnicityID") and len(arguments.EthnicityID)>
			AND	EthnicityID = <cfqueryparam value="#arguments.EthnicityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"OMBEthnicityID") and len(arguments.OMBEthnicityID)>
			AND	OMBEthnicityID = <cfqueryparam value="#arguments.OMBEthnicityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Email") and len(arguments.Email)>
			AND	Email = <cfqueryparam value="#arguments.Email#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Password") and len(arguments.Password)>
			AND	Password = <cfqueryparam value="#arguments.Password#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"PrimaryAddressID") and len(arguments.PrimaryAddressID)>
			AND	PrimaryAddressID = <cfqueryparam value="#arguments.PrimaryAddressID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Birthdate") and len(arguments.Birthdate)>
			AND	Birthdate = <cfqueryparam value="#arguments.Birthdate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"SSN") and len(arguments.SSN)>
			AND	SSN = <cfqueryparam value="#arguments.SSN#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Gender") and len(arguments.Gender)>
			AND	Gender = <cfqueryparam value="#arguments.Gender#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"StatusID") and len(arguments.StatusID)>
			AND	StatusID = <cfqueryparam value="#arguments.StatusID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedBy") and len(arguments.DeletedBy)>
			AND	DeletedBy = <cfqueryparam value="#arguments.DeletedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
	
	<cffunction name="getBySearch" access="public" output="false" returntype="query">
		<cfargument name="Limit" type="string" required="false" default="" />
		<cfargument name="SSN" type="string" required="false" />
		<cfargument name="Birthdate" type="string" required="false" />
		<cfargument name="FirstName" type="string" required="false" />
		<cfargument name="LastName" type="string" required="false" />
		<cfargument name="Email" type="string" required="false" />

		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT   
				<cfif Arguments.Limit NEQ "">
				TOP #Arguments.Limit#
				</cfif>  
				P.personid, 
				P.firstname, 
				P.middlename, 
				P.lastname, 
				P.Birthdate, 
				P.Suffix, 
				P.certname,
				P.displayname,
                (Select TOP 1 SD.Name
                 FROM ce_Person_Degree PD
                 INNER JOIN ce_Sys_Degree SD ON SD.DegreeID = PD.DegreeID AND PD.PersonID = P.PersonID AND PD.DeletedFlag = 'N') AS DisplayDegree,
				P.Email, 
				P.Gender
			FROM
				ce_Person AS P 
			WHERE	0=0
		<cfif structKeyExists(arguments,"SSN") and len(arguments.SSN)>
			AND	ssn = <cfqueryparam value="#arguments.ssn#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Birthdate") and len(arguments.Birthdate)>
			AND	birthdate BETWEEN '#DateFormat(Arguments.Birthdate,"mm/dd/yyyy")# 00:00:00' AND '#DateFormat(Arguments.Birthdate,"mm/dd/yyyy")# 23:59:59'
		</cfif>
		<cfif structKeyExists(arguments,"FirstName") and len(arguments.FirstName)>
			AND	firstname LIKE <cfqueryparam value="%#arguments.firstname#%" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"LastName") and len(arguments.LastName)>
			AND	lastname LIKE <cfqueryparam value="%#arguments.lastname#%" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Email") and len(arguments.Email)>
			AND	Email = <cfqueryparam value="#arguments.Email#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
</cfcomponent>
