
<cfcomponent displayname="AttendeeCreditDAO" hint="table ID column = AttendeeCreditID">

	<cffunction name="init" access="public" output="false" returntype="_com.AttendeeCredit.AttendeeCreditDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="AttendeeCredit" type="_com.AttendeeCredit.AttendeeCredit" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_AttendeeCredit
					(
					AttendeeID,
					CreditID,
					Amount,
					ReferenceNo,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.AttendeeCredit.getAttendeeID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.AttendeeCredit.getCreditID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.AttendeeCredit.getAmount()#" CFSQLType="cf_sql_float" null="#not len(arguments.AttendeeCredit.getAmount())#" />,
					<cfqueryparam value="#arguments.AttendeeCredit.getReferenceNo()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCredit.getReferenceNo())#" />,
					<cfqueryparam value="#arguments.AttendeeCredit.getCreatedBy()#" CFSQLType="cf_sql_integer" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.ID />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.AttendeeCredit.AttendeeCredit">
		<cfargument name="AttendeeCredit" type="_com.AttendeeCredit.AttendeeCredit" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					AttendeeCreditID,
					AttendeeID,
					CreditID,
					Amount,
					ReferenceNo,
					Created,
					CreatedBy,
					Updated,
					UpdatedBy,
					Deleted,
					DeletedFlag
				FROM	ce_AttendeeCredit
				WHERE	AttendeeID = <cfqueryparam value="#arguments.AttendeeCredit.getAttendeeID()#" CFSQLType="cf_sql_integer" />
                <cfif Arguments.AttendeeCredit.getCreditID() NEQ "">
                	AND CreditID = <cfqueryparam value="#arguments.AttendeeCredit.getCreditID()#" cfsqltype="cf_sql_integer" />
                </cfif>
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset AttendeeCreditBean = arguments.AttendeeCredit.init(argumentCollection=strReturn)>
			<cfreturn AttendeeCreditBean>
		</cfif>
	</cffunction>

	<cffunction name="readByAttendeeCreditID" access="public" output="false" returntype="_com.AttendeeCredit.AttendeeCredit">
		<cfargument name="AttendeeCredit" type="_com.AttendeeCredit.AttendeeCredit" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					AttendeeCreditID,
					AttendeeID,
					CreditID,
					Amount,
					ReferenceNo,
					Created,
					CreatedBy,
					Updated,
					UpdatedBy,
					Deleted,
					DeletedFlag
				FROM	ce_AttendeeCredit
				WHERE	AttendeeID = <cfqueryparam value="#arguments.AttendeeCredit.getAttendeeID()#" CFSQLType="cf_sql_integer" />
                <cfif Arguments.AttendeeCredit.getCreditID() NEQ "">
                	AND CreditID = <cfqueryparam value="#arguments.AttendeeCredit.getCreditID()#" cfsqltype="cf_sql_integer" />
                </cfif>
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset AttendeeCreditBean = arguments.AttendeeCredit.init(argumentCollection=strReturn)>
			<cfreturn AttendeeCreditBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="AttendeeCredit" type="_com.AttendeeCredit.AttendeeCredit" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_AttendeeCredit
				SET
					AttendeeID = <cfqueryparam value="#arguments.AttendeeCredit.getAttendeeID()#" CFSQLType="cf_sql_integer" />,
					CreditID = <cfqueryparam value="#arguments.AttendeeCredit.getCreditID()#" CFSQLType="cf_sql_integer" />,
					Amount = <cfqueryparam value="#arguments.AttendeeCredit.getAmount()#" CFSQLType="cf_sql_float" null="#not len(arguments.AttendeeCredit.getAmount())#" />,
					ReferenceNo = <cfqueryparam value="#arguments.AttendeeCredit.getReferenceNo()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCredit.getReferenceNo())#" />,
					Created = <cfqueryparam value="#arguments.AttendeeCredit.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AttendeeCredit.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.AttendeeCredit.getCreatedBy()#" CFSQLType="cf_sql_integer" />,
					Updated = <cfqueryparam value="#arguments.AttendeeCredit.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AttendeeCredit.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.AttendeeCredit.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCredit.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.AttendeeCredit.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AttendeeCredit.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.AttendeeCredit.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.AttendeeCredit.getDeletedFlag())#" />
				WHERE	AttendeeID = <cfqueryparam value="#arguments.AttendeeCredit.getAttendeeID()#" CFSQLType="cf_sql_integer" />
                <cfif Arguments.AttendeeCredit.getCreditID() NEQ "">
                	AND CreditID = <cfqueryparam value="#arguments.AttendeeCredit.getCreditID()#" cfsqltype="cf_sql_integer" />
                </cfif>
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="updateByAttendeeCreditID" access="public" output="false" returntype="boolean">
		<cfargument name="AttendeeCredit" type="_com.AttendeeCredit.AttendeeCredit" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_AttendeeCredit
				SET
					AttendeeID = <cfqueryparam value="#arguments.AttendeeCredit.getAttendeeID()#" CFSQLType="cf_sql_integer" />,
					CreditID = <cfqueryparam value="#arguments.AttendeeCredit.getCreditID()#" CFSQLType="cf_sql_integer" />,
					Amount = <cfqueryparam value="#arguments.AttendeeCredit.getAmount()#" CFSQLType="cf_sql_float" null="#not len(arguments.AttendeeCredit.getAmount())#" />,
					ReferenceNo = <cfqueryparam value="#arguments.AttendeeCredit.getReferenceNo()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCredit.getReferenceNo())#" />,
					Created = <cfqueryparam value="#arguments.AttendeeCredit.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AttendeeCredit.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.AttendeeCredit.getCreatedBy()#" CFSQLType="cf_sql_integer" />,
					Updated = <cfqueryparam value="#arguments.AttendeeCredit.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AttendeeCredit.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.AttendeeCredit.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCredit.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.AttendeeCredit.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AttendeeCredit.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.AttendeeCredit.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.AttendeeCredit.getDeletedFlag())#" />
				WHERE	
				<cfif Arguments.AttendeeCredit.getAttendeeID() NEQ "">
                	AttendeeID = <cfqueryparam value="#Arguments.AttendeeCredit.getAttendeeID()#" cfsqltype="cf_sql_integer" />
                <cfelse>
                	AttendeeCreditID = <cfqueryparam value="#arguments.AttendeeCredit.getAttendeeCreditID()#" CFSQLType="cf_sql_integer" />
                </cfif>
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="AttendeeCredit" type="_com.AttendeeCredit.AttendeeCredit" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_AttendeeCredit 
				WHERE	AttendeeID = <cfqueryparam value="#arguments.AttendeeCredit.getAttendeeID()#" CFSQLType="cf_sql_integer" />
                <cfif Arguments.AttendeeCredit.getCreditID() NEQ "">
                	AND CreditID = <cfqueryparam value="#arguments.AttendeeCredit.getCreditID()#" cfsqltype="cf_sql_integer" />
                </cfif>
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="AttendeeCredit" type="_com.AttendeeCredit.AttendeeCredit" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_AttendeeCredit
			WHERE	AttendeeID = <cfqueryparam value="#arguments.AttendeeCredit.getAttendeeID()#" CFSQLType="cf_sql_integer" />
			<cfif Arguments.AttendeeCredit.getCreditID() NEQ "">
                AND CreditID = <cfqueryparam value="#arguments.AttendeeCredit.getCreditID()#" cfsqltype="cf_sql_integer" />
            </cfif>
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="AttendeeCredit" type="_com.AttendeeCredit.AttendeeCredit" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.AttendeeCredit)>
			<cfset success = update(arguments.AttendeeCredit) />
		<cfelse>
			<cfset success = create(arguments.AttendeeCredit) />
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
