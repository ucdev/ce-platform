
<cfcomponent displayname="PersonEmailDAO" hint="table ID column = email_id">

	<cffunction name="init" access="public" output="false" returntype="_com.PersonEmail.PersonEmailDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="PersonEmail" type="_com.PersonEmail.PersonEmail" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Person_Email
					(
					person_id,
					email_address,
					is_verified,
					verification_key,
					allow_login
					)
				VALUES
					(
					<cfqueryparam value="#arguments.PersonEmail.getperson_id()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.PersonEmail.getemail_address()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.PersonEmail.getis_verified()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.PersonEmail.getis_verified())#" />,
					<cfqueryparam value="#arguments.PersonEmail.getverification_key()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.PersonEmail.getallow_login()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.PersonEmail.getallow_login())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.ID />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.personEmail.personEmail">
		<cfargument name="PersonEmail" type="_com.PersonEmail.PersonEmail" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
        
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					email_id,
					person_id,
					email_address,
					is_verified,
					verification_key,
					allow_login
				FROM	ce_Person_Email
				WHERE	email_id = <cfqueryparam value="#arguments.PersonEmail.getemail_id()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is and set an empty query for the conditional logic below --->
				<cfset qRead = queryNew("id") />
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset personEmailBean = arguments.PersonEmail.init(argumentCollection=strReturn)>
			<cfreturn personEmailBean />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="PersonEmail" type="_com.PersonEmail.PersonEmail" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Person_Email
				SET
					person_id = <cfqueryparam value="#arguments.PersonEmail.getperson_id()#" CFSQLType="cf_sql_integer" />,
					email_address = <cfqueryparam value="#arguments.PersonEmail.getemail_address()#" CFSQLType="cf_sql_varchar" />,
					is_verified = <cfqueryparam value="#arguments.PersonEmail.getis_verified()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.PersonEmail.getis_verified())#" />,
					verification_key = <cfqueryparam value="#arguments.PersonEmail.getverification_key()#" CFSQLType="cf_sql_varchar" />,
					allow_login = <cfqueryparam value="#arguments.PersonEmail.getallow_login()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.PersonEmail.getallow_login())#" />
				WHERE	email_id = <cfqueryparam value="#arguments.PersonEmail.getemail_id()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="PersonEmail" type="_com.PersonEmail.PersonEmail" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Person_Email 
				WHERE	email_id = <cfqueryparam value="#arguments.PersonEmail.getemail_id()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="PersonEmail" type="_com.PersonEmail.PersonEmail" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Person_Email
			WHERE	email_id = <cfqueryparam value="#arguments.PersonEmail.getemail_id()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="PersonEmail" type="_com.PersonEmail.PersonEmail" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.PersonEmail)>
			<cfset success = update(arguments.PersonEmail) />
		<cfelse>
			<cfset success = create(arguments.PersonEmail) />
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
