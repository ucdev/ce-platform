<cfcomponent displayname="AttendeeDAO" hint="table ID column = AttendeeID">

	<cffunction name="init" access="public" output="false" returntype="_com.Attendee.AttendeeDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="Attendee" type="_com.Attendee.Attendee" required="true" />

		<cfset var qCreate = "" />
		
		<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Attendee
					(
					ActivityID,
					PersonID,
					StatusID,
					CheckedInFlag,
					CheckIn,
					CheckedOutFlag,
					CheckOut,
					MDflag,
					TermsFlag,
					PaymentFlag,
					PayAmount,
					PayOrderNo,
					PaymentDate,
					RegisterDate,
					CompleteDate,
					TermDate,
					firstName,
					middleName,
					lastName,
					email,
					certName,
					address1,
					address2,
					city,
					stateProvince,
					stateId,
					countryId,
					postalCode,
					phone1,
					phone1ext,
					phone2,
					phone2ext,
					fax,
					faxext,
					entryMethod,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.Attendee.getActivityID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.Attendee.getPersonID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.Attendee.getStatusID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Attendee.getStatusID())#" />,
					<cfqueryparam value="#arguments.Attendee.getCheckedInFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Attendee.getCheckedInFlag())#" />,
					<cfqueryparam value="#arguments.Attendee.getCheckIn()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Attendee.getCheckIn())#" />,
					<cfqueryparam value="#arguments.Attendee.getCheckedOutFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Attendee.getCheckedOutFlag())#" />,
					<cfqueryparam value="#arguments.Attendee.getCheckOut()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Attendee.getCheckOut())#" />,
					<cfqueryparam value="#arguments.Attendee.getMDflag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Attendee.getMDflag())#" />,
					<cfqueryparam value="#arguments.Attendee.getTermsFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Attendee.getTermsFlag())#" />,
					<cfqueryparam value="#arguments.Attendee.getPaymentFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Attendee.getPaymentFlag())#" />,
					<cfqueryparam value="#arguments.Attendee.getPayAmount()#" CFSQLType="cf_sql_float" null="#not len(arguments.Attendee.getPayAmount())#" />,
					<cfqueryparam value="#arguments.Attendee.getPayOrderNo()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getPayOrderNo())#" />,
					<cfqueryparam value="#arguments.Attendee.getPaymentDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Attendee.getPaymentDate())#" />,
					<cfqueryparam value="#arguments.Attendee.getRegisterDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Attendee.getRegisterDate())#" />,
					<cfqueryparam value="#arguments.Attendee.getCompleteDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Attendee.getCompleteDate())#" />,
					<cfqueryparam value="#arguments.Attendee.getTermDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Attendee.getTermDate())#" />,
					<cfqueryparam value="#arguments.Attendee.getfirstName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getfirstName())#" />,
					<cfqueryparam value="#arguments.Attendee.getmiddleName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getmiddleName())#" />,
					<cfqueryparam value="#arguments.Attendee.getlastName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getlastName())#" />,
					<cfqueryparam value="#arguments.Attendee.getemail()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getemail())#" />,
					<cfqueryparam value="#arguments.Attendee.getcertName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getcertName())#" />,
					<cfqueryparam value="#arguments.Attendee.getaddress1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getaddress1())#" />,
					<cfqueryparam value="#arguments.Attendee.getaddress2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getaddress2())#" />,
					<cfqueryparam value="#arguments.Attendee.getcity()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getcity())#" />,
					<cfqueryparam value="#arguments.Attendee.getstateProvince()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getstateProvince())#" />,
					<cfqueryparam value="#arguments.Attendee.getstateId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Attendee.getstateId())#" />,
					<cfqueryparam value="#arguments.Attendee.getcountryId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Attendee.getcountryId())#" />,
					<cfqueryparam value="#arguments.Attendee.getpostalCode()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getpostalCode())#" />,
					<cfqueryparam value="#arguments.Attendee.getphone1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getphone1())#" />,
					<cfqueryparam value="#arguments.Attendee.getphone1ext()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getphone1ext())#" />,
					<cfqueryparam value="#arguments.Attendee.getphone2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getphone2())#" />,
					<cfqueryparam value="#arguments.Attendee.getphone2ext()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getphone2ext())#" />,
					<cfqueryparam value="#arguments.Attendee.getfax()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getfax())#" />,
					<cfqueryparam value="#arguments.Attendee.getfaxext()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getfaxext())#" />,
					<cfqueryparam value="#arguments.Attendee.getentryMethod()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getentryMethod())#" />,
					<cfqueryparam value="#arguments.Attendee.getCreatedBy()#" CFSQLType="cf_sql_integer" />
					)
			</cfquery>
		<cftry>
			
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.Attendee.Attendee">
		<cfargument name="Attendee" type="_com.Attendee.Attendee" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					AttendeeID,
					ActivityID,
					PersonID,
					StatusID,
					CheckedInFlag,
					CheckIn,
					CheckedOutFlag,
					CheckOut,
					MDflag,
					TermsFlag,
					PaymentFlag,
					PayAmount,
					PayOrderNo,
					PaymentDate,
					RegisterDate,
					CompleteDate,
					TermDate,
					firstName,
					middleName,
					lastName,
					email,
					certName,
					address1,
					address2,
					city,
					stateProvince,
					stateId,
					countryId,
					postalCode,
					phone1,
					phone1ext,
					phone2,
					phone2ext,
					fax,
					faxext,
					entryMethod,
					Created,
					CreatedBy,
					Updated,
					UpdatedBy,
					Deleted,
					DeletedFlag
				FROM	ce_Attendee
				WHERE	
				<cfif arguments.Attendee.getAttendeeID() GT 0>
					AttendeeID = <cfqueryparam value="#arguments.Attendee.getAttendeeID()#" CFSQLType="cf_sql_integer" />
				<cfelse>
					<cfif arguments.Attendee.getPersonID() GT 0>
						ActivityID = <cfqueryparam value="#arguments.Attendee.getActivityID()#" CFSQLType="cf_sql_integer" /> AND 
						PersonID = <cfqueryparam value="#arguments.Attendee.getPersonID()#" CFSQLType="cf_sql_integer" />
					<cfelse>
						0 = 1
					</cfif>
				</cfif>
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset AttendeeBean = arguments.Attendee.init(argumentCollection=strReturn)>
			<cfreturn AttendeeBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="Attendee" type="_com.Attendee.Attendee" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Attendee
				SET
					ActivityID = <cfqueryparam value="#arguments.Attendee.getActivityID()#" CFSQLType="cf_sql_integer" />,
					PersonID = <cfqueryparam value="#arguments.Attendee.getPersonID()#" CFSQLType="cf_sql_integer" />,
					StatusID = <cfqueryparam value="#arguments.Attendee.getStatusID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Attendee.getStatusID())#" />,
					CheckedInFlag = <cfqueryparam value="#arguments.Attendee.getCheckedInFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Attendee.getCheckedInFlag())#" />,
					CheckIn = <cfqueryparam value="#arguments.Attendee.getCheckIn()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Attendee.getCheckIn())#" />,
					CheckedOutFlag = <cfqueryparam value="#arguments.Attendee.getCheckedOutFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Attendee.getCheckedOutFlag())#" />,
					CheckOut = <cfqueryparam value="#arguments.Attendee.getCheckOut()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Attendee.getCheckOut())#" />,
					MDflag = <cfqueryparam value="#arguments.Attendee.getMDflag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Attendee.getMDflag())#" />,
					TermsFlag = <cfqueryparam value="#arguments.Attendee.getTermsFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Attendee.getTermsFlag())#" />,
					PaymentFlag = <cfqueryparam value="#arguments.Attendee.getPaymentFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Attendee.getPaymentFlag())#" />,
					PayAmount = <cfqueryparam value="#arguments.Attendee.getPayAmount()#" CFSQLType="cf_sql_float" null="#not len(arguments.Attendee.getPayAmount())#" />,
					PayOrderNo = <cfqueryparam value="#arguments.Attendee.getPayOrderNo()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getPayOrderNo())#" />,
					PaymentDate = <cfqueryparam value="#arguments.Attendee.getPaymentDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Attendee.getPaymentDate())#" />,
					RegisterDate = <cfqueryparam value="#arguments.Attendee.getRegisterDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Attendee.getRegisterDate())#" />,
					CompleteDate = <cfqueryparam value="#arguments.Attendee.getCompleteDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Attendee.getCompleteDate())#" />,
					TermDate = <cfqueryparam value="#arguments.Attendee.getTermDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Attendee.getTermDate())#" />,
					firstName = <cfqueryparam value="#arguments.Attendee.getfirstName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getfirstName())#" />,
					middleName = <cfqueryparam value="#arguments.Attendee.getmiddleName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getmiddleName())#" />,
					lastName = <cfqueryparam value="#arguments.Attendee.getlastName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getlastName())#" />,
					email = <cfqueryparam value="#arguments.Attendee.getemail()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getemail())#" />,
					certName = <cfqueryparam value="#arguments.Attendee.getcertName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getcertName())#" />,
					address1 = <cfqueryparam value="#arguments.Attendee.getaddress1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getaddress1())#" />,
					address2 = <cfqueryparam value="#arguments.Attendee.getaddress2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getaddress2())#" />,
					city = <cfqueryparam value="#arguments.Attendee.getcity()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getcity())#" />,
					stateProvince = <cfqueryparam value="#arguments.Attendee.getstateProvince()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getstateProvince())#" />,
					stateId = <cfqueryparam value="#arguments.Attendee.getstateId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Attendee.getstateId())#" />,
					countryId = <cfqueryparam value="#arguments.Attendee.getcountryId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Attendee.getcountryId())#" />,
					postalCode = <cfqueryparam value="#arguments.Attendee.getpostalCode()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getpostalCode())#" />,
					phone1 = <cfqueryparam value="#arguments.Attendee.getphone1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getphone1())#" />,
					phone1ext = <cfqueryparam value="#arguments.Attendee.getphone1ext()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getphone1ext())#" />,
					phone2 = <cfqueryparam value="#arguments.Attendee.getphone2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getphone2())#" />,
					phone2ext = <cfqueryparam value="#arguments.Attendee.getphone2ext()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getphone2ext())#" />,
					fax = <cfqueryparam value="#arguments.Attendee.getfax()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getfax())#" />,
					faxext = <cfqueryparam value="#arguments.Attendee.getfaxext()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getfaxext())#" />,
					entryMethod = <cfqueryparam value="#arguments.Attendee.getentryMethod()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Attendee.getentryMethod())#" />,
					Created = <cfqueryparam value="#arguments.Attendee.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Attendee.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.Attendee.getCreatedBy()#" CFSQLType="cf_sql_integer" />,
					Updated = <cfqueryparam value="#arguments.Attendee.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Attendee.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.Attendee.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Attendee.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.Attendee.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Attendee.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.Attendee.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Attendee.getDeletedFlag())#" />
				WHERE
				<cfif arguments.Attendee.getAttendeeID() GT 0>
					AttendeeID = <cfqueryparam value="#arguments.Attendee.getAttendeeID()#" CFSQLType="cf_sql_integer" />
				<cfelse>
					<cfif arguments.Attendee.getPersonID() GT 0>
						ActivityID = <cfqueryparam value="#arguments.Attendee.getActivityID()#" CFSQLType="cf_sql_integer" /> AND 
						PersonID = <cfqueryparam value="#arguments.Attendee.getPersonID()#" CFSQLType="cf_sql_integer" />
					<cfelse>
						0 = 1
					</cfif>
				</cfif>
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="Attendee" type="_com.Attendee.Attendee" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Attendee 
				WHERE
				<cfif arguments.Attendee.getAttendeeID() GT 0>
					AttendeeID = <cfqueryparam value="#arguments.Attendee.getAttendeeID()#" CFSQLType="cf_sql_integer" />
				<cfelse>
					<cfif arguments.Attendee.getPersonID() GT 0>
						ActivityID = <cfqueryparam value="#arguments.Attendee.getActivityID()#" CFSQLType="cf_sql_integer" /> AND 
						PersonID = <cfqueryparam value="#arguments.Attendee.getPersonID()#" CFSQLType="cf_sql_integer" />
					<cfelse>
						0 = 1
					</cfif>
				</cfif>
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="Attendee" type="_com.Attendee.Attendee" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Attendee
			WHERE
				<cfif arguments.Attendee.getAttendeeID() GT 0>
					AttendeeID = <cfqueryparam value="#arguments.Attendee.getAttendeeID()#" CFSQLType="cf_sql_integer" />
				<cfelse>
					<cfif arguments.Attendee.getPersonID() GT 0>
						ActivityID = <cfqueryparam value="#arguments.Attendee.getActivityID()#" CFSQLType="cf_sql_integer" /> AND 
						PersonID = <cfqueryparam value="#arguments.Attendee.getPersonID()#" CFSQLType="cf_sql_integer" />
					<cfelse>
						0 = 1
					</cfif>
				</cfif>
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="Attendee" type="_com.Attendee.Attendee" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.Attendee)>
			<cfset success = update(arguments.Attendee) />
		<cfelse>
			<cfset success = create(arguments.Attendee) />
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
