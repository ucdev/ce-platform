<cfcomponent displayname="PersonDAO" hint="table ID column = PersonID">

	<cffunction name="init" access="public" output="false" returntype="_com.Person.PersonDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="Person" type="_com.Person.Person" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Person
					(
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
					CreatedBy,
					DeletedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.Person.getPrefix()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Person.getPrefix())#" />,
					<cfqueryparam value="#arguments.Person.getFirstName()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.Person.getMiddleName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Person.getMiddleName())#" />,
					<cfqueryparam value="#arguments.Person.getLastName()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.Person.getSuffix()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Person.getSuffix())#" />,
					<cfqueryparam value="#arguments.Person.getCertName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Person.getCertName())#" />,
					<cfqueryparam value="#arguments.Person.getDisplayName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Person.getDisplayName())#" />,
					<cfqueryparam value="#arguments.Person.getEthnicityID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Person.getEthnicityID())#" />,
					<cfqueryparam value="#arguments.Person.getOMBEthnicityID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Person.getOMBEthnicityID())#" />,
					<cfqueryparam value="#arguments.Person.getEmail()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Person.getEmail())#" />,
					<cfqueryparam value="#arguments.Person.getPassword()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Person.getPassword())#" />,
					<cfqueryparam value="#arguments.Person.getPrimaryAddressID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Person.getPrimaryAddressID())#" />,
					<cfqueryparam value="#arguments.Person.getBirthdate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Person.getBirthdate())#" />,
					<cfqueryparam value="#arguments.Person.getSSN()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Person.getSSN())#" />,
					<cfqueryparam value="#arguments.Person.getGender()#" CFSQLType="cf_sql_char" null="#not len(arguments.Person.getGender())#" />,
					<cfqueryparam value="#arguments.Person.getStatusID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Person.getStatusID())#" />,
					<cfqueryparam value="#arguments.Person.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Person.getCreatedBy())#" />,
					<cfqueryparam value="#arguments.Person.getDeletedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Person.getDeletedBy())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.ID />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.Person.Person">
		<cfargument name="Person" type="_com.Person.Person" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
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
				WHERE	PersonID = <cfqueryparam value="#arguments.Person.getPersonID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset PersonBean = arguments.Person.init(argumentCollection=strReturn)>
			<cfreturn PersonBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="Person" type="_com.Person.Person" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Person
				SET
					Prefix = <cfqueryparam value="#arguments.Person.getPrefix()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Person.getPrefix())#" />,
					FirstName = <cfqueryparam value="#arguments.Person.getFirstName()#" CFSQLType="cf_sql_varchar" />,
					MiddleName = <cfqueryparam value="#arguments.Person.getMiddleName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Person.getMiddleName())#" />,
					LastName = <cfqueryparam value="#arguments.Person.getLastName()#" CFSQLType="cf_sql_varchar" />,
					Suffix = <cfqueryparam value="#arguments.Person.getSuffix()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Person.getSuffix())#" />,
					CertName = <cfqueryparam value="#arguments.Person.getCertName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Person.getCertName())#" />,
					DisplayName = <cfqueryparam value="#arguments.Person.getDisplayName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Person.getDisplayName())#" />,
					EthnicityID = <cfqueryparam value="#arguments.Person.getEthnicityID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Person.getEthnicityID())#" />,
					OMBEthnicityID = <cfqueryparam value="#arguments.Person.getOMBEthnicityID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Person.getOMBEthnicityID())#" />,
					Email = <cfqueryparam value="#arguments.Person.getEmail()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Person.getEmail())#" />,
					Password = <cfqueryparam value="#arguments.Person.getPassword()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Person.getPassword())#" />,
					PrimaryAddressID = <cfqueryparam value="#arguments.Person.getPrimaryAddressID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Person.getPrimaryAddressID())#" />,
					Birthdate = <cfqueryparam value="#arguments.Person.getBirthdate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Person.getBirthdate())#" />,
					SSN = <cfqueryparam value="#arguments.Person.getSSN()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Person.getSSN())#" />,
					Gender = <cfqueryparam value="#arguments.Person.getGender()#" CFSQLType="cf_sql_char" null="#not len(arguments.Person.getGender())#" />,
					StatusID = <cfqueryparam value="#arguments.Person.getStatusID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Person.getStatusID())#" />,
					Created = <cfqueryparam value="#arguments.Person.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Person.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.Person.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Person.getCreatedBy())#" />,
					Updated = <cfqueryparam value="#arguments.Person.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Person.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.Person.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Person.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.Person.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Person.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.Person.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Person.getDeletedFlag())#" />,
					DeletedBy = <cfqueryparam value="#arguments.Person.getDeletedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Person.getDeletedBy())#" />
				WHERE	PersonID = <cfqueryparam value="#arguments.Person.getPersonID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="Person" type="_com.Person.Person" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Person 
				WHERE	PersonID = <cfqueryparam value="#arguments.Person.getPersonID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="Person" type="_com.Person.Person" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Person
			WHERE	PersonID = <cfqueryparam value="#arguments.Person.getPersonID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="Person" type="_com.Person.Person" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.Person)>
			<cfset success = update(arguments.Person) />
		<cfelse>
			<cfset success = create(arguments.Person) />
		</cfif>
		
		<cfreturn success />
	</cffunction>

	<cffunction name="queryRowToStruct" access="private" output="false" returntype="struct">
		<cfargument name="qry" type="query" required="true">
		
		<cfscript>
			/**
			 * Makes a row of a query into a structure.
			 * 
			 * @param query 	 The query to work with. 
			 * @param row 	 Row number to check. Defaults to row 1. 
			 * @return Returns a structure. 
			 * @author Nathan Dintenfass (nathan@changemedia.com) 
			 * @version 1, December 11, 2001 
			 */
			//by default, do this to the first row of the query
			var row = 1;
			//a var for looping
			var ii = 1;
			//the cols to loop over
			var cols = listToArray(qry.columnList);
			//the struct to return
			var stReturn = structnew();
			//if there is a second argument, use that for the row number
			if(arrayLen(arguments) GT 1)
				row = arguments[2];
			//loop over the cols and build the struct from the query row
			for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
				stReturn[cols[ii]] = qry[cols[ii]][row];
			}		
			//return the struct
			return stReturn;
		</cfscript>
	</cffunction>

</cfcomponent>