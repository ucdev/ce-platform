
<cfcomponent displayname="PersonAddressDAO" hint="table ID column = AddressID">

	<cffunction name="init" access="public" output="false" returntype="_com.PersonAddress.PersonAddressDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="PersonAddress" type="_com.PersonAddress.PersonAddress" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Person_Address
					(
					PersonID,
					AddressTypeID,
					Address1,
					Address2,
					City,
					State,
					Province,
					Country,
					ZipCode,
					geonameid,
					Phone1,
					Phone1ext,
					Phone2,
					Phone2ext,
					Phone3,
					Phone3ext,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.PersonAddress.getPersonID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.PersonAddress.getAddressTypeID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.PersonAddress.getAddressTypeID())#" />,
					<cfqueryparam value="#arguments.PersonAddress.getAddress1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getAddress1())#" />,
					<cfqueryparam value="#arguments.PersonAddress.getAddress2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getAddress2())#" />,
					<cfqueryparam value="#arguments.PersonAddress.getCity()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getCity())#" />,
					<cfqueryparam value="#arguments.PersonAddress.getState()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getState())#" />,
					<cfqueryparam value="#arguments.PersonAddress.getProvince()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getProvince())#" />,
					<cfqueryparam value="#arguments.PersonAddress.getCountry()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getCountry())#" />,
					<cfqueryparam value="#arguments.PersonAddress.getZipCode()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getZipCode())#" />,
					<cfqueryparam value="#arguments.PersonAddress.getGeonameId()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getGeonameId())#" />,
					<cfqueryparam value="#arguments.PersonAddress.getPhone1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getPhone1())#" />,
					<cfqueryparam value="#arguments.PersonAddress.getPhone1ext()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getPhone1())#" />,
					<cfqueryparam value="#arguments.PersonAddress.getPhone2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getPhone2())#" />,
					<cfqueryparam value="#arguments.PersonAddress.getPhone2ext()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getPhone2())#" />,
					<cfqueryparam value="#arguments.PersonAddress.getPhone3()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getPhone3())#" />,
					<cfqueryparam value="#arguments.PersonAddress.getPhone3ext()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getPhone3())#" />,
					<cfqueryparam value="#arguments.PersonAddress.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.PersonAddress.getCreatedBy())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.ID />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.PersonAddress.PersonAddress">
		<cfargument name="PersonAddress" type="_com.PersonAddress.PersonAddress" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					AddressID,
					PersonID,
					AddressTypeID,
					Address1,
					Address2,
					City,
					State,
					Province,
					Country,
					ZipCode,
					GeonameId,
					Phone1,
					Phone1ext,
					Phone2,
					Phone2ext,
					Phone3,
					Phone3ext,
					Created,
					CreatedBy,
					Updated,
					UpdatedBy
				FROM	ce_Person_Address
				WHERE	AddressID = <cfqueryparam value="#arguments.PersonAddress.getAddressID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset PersonAddressBean = arguments.PersonAddress.init(argumentCollection=strReturn)>
			<cfreturn PersonAddressBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="PersonAddress" type="_com.PersonAddress.PersonAddress" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Person_Address
				SET
					PersonID = <cfqueryparam value="#arguments.PersonAddress.getPersonID()#" CFSQLType="cf_sql_integer" />,
					AddressTypeID = <cfqueryparam value="#arguments.PersonAddress.getAddressTypeID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.PersonAddress.getAddressTypeID())#" />,
					Address1 = <cfqueryparam value="#arguments.PersonAddress.getAddress1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getAddress1())#" />,
					Address2 = <cfqueryparam value="#arguments.PersonAddress.getAddress2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getAddress2())#" />,
					City = <cfqueryparam value="#arguments.PersonAddress.getCity()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getCity())#" />,
					State = <cfqueryparam value="#arguments.PersonAddress.getState()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getState())#" />,
					Province = <cfqueryparam value="#arguments.PersonAddress.getProvince()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getProvince())#" />,
					Country = <cfqueryparam value="#arguments.PersonAddress.getCountry()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getCountry())#" />,
					ZipCode = <cfqueryparam value="#arguments.PersonAddress.getZipCode()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getZipCode())#" />,
					GeonameId = <cfqueryparam value="#arguments.PersonAddress.getGeonameId()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getGeonameId())#" />,
					Phone1 = <cfqueryparam value="#arguments.PersonAddress.getPhone1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getPhone1())#" />,
					Phone1ext = <cfqueryparam value="#arguments.PersonAddress.getPhone1ext()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getPhone1ext())#" />,
					Phone2 = <cfqueryparam value="#arguments.PersonAddress.getPhone2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getPhone2())#" />,
					Phone2ext = <cfqueryparam value="#arguments.PersonAddress.getPhone2ext()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getPhone2ext())#" />,
					Phone3 = <cfqueryparam value="#arguments.PersonAddress.getPhone3()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getPhone3())#" />,
					Phone3ext = <cfqueryparam value="#arguments.PersonAddress.getPhone3ext()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.PersonAddress.getPhone3ext())#" />,
					Created = <cfqueryparam value="#arguments.PersonAddress.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.PersonAddress.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.PersonAddress.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.PersonAddress.getCreatedBy())#" />,
					Updated = <cfqueryparam value="#arguments.PersonAddress.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.PersonAddress.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.PersonAddress.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.PersonAddress.getUpdatedBy())#" />
				WHERE	AddressID = <cfqueryparam value="#arguments.PersonAddress.getAddressID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="PersonAddress" type="_com.PersonAddress.PersonAddress" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Person_Address 
				WHERE	AddressID = <cfqueryparam value="#arguments.PersonAddress.getAddressID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="PersonAddress" type="_com.PersonAddress.PersonAddress" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Person_Address
			WHERE	AddressID = <cfqueryparam value="#arguments.PersonAddress.getAddressID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="PersonAddress" type="_com.PersonAddress.PersonAddress" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.PersonAddress)>
			<cfset success = update(arguments.PersonAddress) />
		<cfelse>
			<cfset success = create(arguments.PersonAddress) />
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
