
<cfcomponent displayname="ActivityDAO" hint="table ID column = ActivityID">

	<cffunction name="init" access="public" output="false" returntype="_com.Activity.ActivityDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="Activity" type="_com.Activity.Activity" required="true" />

		<cfset var qCreate = "" />
		<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Activity
					(
					ParentActivityID,
					ActivityTypeID,
					GroupingID,
					Title,
					Description,
					ReleaseDate,
					StartDate,
					EndDate,
					LocationID,
					Location,
					Address1,
					Address2,
					City,
					State,
					Country,
					PostalCode,
					SessionType,
					StatusID,
					StatMaxRegistrants,
					StatAttendees,
					StatAddlAttendees,
					StatCMEHours,
					StatMD,
					StatNonMD,
					StatSupporters,
					StatSuppAmount,
					Sponsorship,
					Sponsor,
					ExternalID,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.Activity.getParentActivityID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Activity.getParentActivityID())#" />,
					<cfqueryparam value="#arguments.Activity.getActivityTypeID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.Activity.getGroupingID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Activity.getGroupingID())#" />,
					<cfqueryparam value="#arguments.Activity.getTitle()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.Activity.getDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Activity.getDescription())#" />,
					<cfqueryparam value="#arguments.Activity.getReleaseDate()#" CFSQLType="cf_sql_timestamp" />,
					<cfqueryparam value="#arguments.Activity.getStartDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Activity.getStartDate())#" />,
					<cfqueryparam value="#arguments.Activity.getEndDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Activity.getEndDate())#" />,
					<cfqueryparam value="#arguments.Activity.getLocationID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Activity.getLocationID())#" />,
					<cfqueryparam value="#arguments.Activity.getLocation()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Activity.getLocation())#" />,
					<cfqueryparam value="#arguments.Activity.getAddress1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Activity.getAddress1())#" />,
					<cfqueryparam value="#arguments.Activity.getAddress2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Activity.getAddress2())#" />,
					<cfqueryparam value="#arguments.Activity.getCity()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Activity.getCity())#" />,
					<cfqueryparam value="#arguments.Activity.getState()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Activity.getState())#" />,
					<cfqueryparam value="#arguments.Activity.getCountry()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Activity.getCountry())#" />,
					<cfqueryparam value="#arguments.Activity.getPostalCode()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Activity.getPostalCode())#" />,
					<cfqueryparam value="#arguments.Activity.getSessionType()#" CFSQLType="cf_sql_char" null="#not len(arguments.Activity.getSessionType())#" />,
					<cfqueryparam value="#arguments.Activity.getStatusID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Activity.getStatusID())#" />,
					<cfqueryparam value="#arguments.Activity.getStatMaxRegistrants()#" CFSQLType="cf_sql_float" null="#not len(arguments.Activity.getStatMaxRegistrants())#" />,
					<cfqueryparam value="#arguments.Activity.getStatAttendees()#" CFSQLType="cf_sql_float" null="#not len(arguments.Activity.getStatAttendees())#" />,
					<cfqueryparam value="#arguments.Activity.getStatAddlAttendees()#" CFSQLType="cf_sql_float" null="#not len(arguments.Activity.getStatAddlAttendees())#" />,
					<cfqueryparam value="#arguments.Activity.getStatCMEHours()#" CFSQLType="cf_sql_float" null="#not len(arguments.Activity.getStatCMEHours())#" />,
					<cfqueryparam value="#arguments.Activity.getStatMD()#" CFSQLType="cf_sql_float" null="#not len(arguments.Activity.getStatMD())#" />,
					<cfqueryparam value="#arguments.Activity.getStatNonMD()#" CFSQLType="cf_sql_float" null="#not len(arguments.Activity.getStatNonMD())#" />,
					<cfqueryparam value="#arguments.Activity.getStatSupporters()#" CFSQLType="cf_sql_float" null="#not len(arguments.Activity.getStatSupporters())#" />,
					<cfqueryparam value="#arguments.Activity.getStatSuppAmount()#" CFSQLType="cf_sql_float" null="#not len(arguments.Activity.getStatSuppAmount())#" />,
					<cfqueryparam value="#arguments.Activity.getSponsorship()#" CFSQLType="cf_sql_char" null="#not len(arguments.Activity.getSponsorship())#" />,
					<cfqueryparam value="#arguments.Activity.getSponsor()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Activity.getSponsor())#" />,
					<cfqueryparam value="#arguments.Activity.getExternalID()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Activity.getExternalID())#" />,
					<cfqueryparam value="#arguments.Activity.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Activity.getCreatedBy())#" />
					)
			</cfquery>
		<cftry>
			
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.Activity.Activity">
		<cfargument name="Activity" type="_com.Activity.Activity" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					ActivityID,
					ParentActivityID,
					ActivityTypeID,
					GroupingID,
					Title,
					Description,
					ReleaseDate,
					StartDate,
					EndDate,
					LocationID,
					Location,
					Address1,
					Address2,
					City,
					State,
					Country,
					PostalCode,
					SessionType,
					StatusID,
					StatMaxRegistrants,
					StatAttendees,
					StatAddlAttendees,
					StatCMEHours,
					StatMD,
					StatNonMD,
					StatSupporters,
					StatSuppAmount,
					Sponsorship,
					Sponsor,
					ExternalID,
					Created,
					CreatedBy,
					Updated,
					UpdatedBy,
					Deleted,
					DeletedFlag
				FROM	ce_Activity
				WHERE	ActivityID = <cfqueryparam value="#arguments.Activity.getActivityID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
		<cftry>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset ActivityBean = arguments.Activity.init(argumentCollection=strReturn)>
			<cfreturn ActivityBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="Activity" type="_com.Activity.Activity" required="true" />

		<cfset var qUpdate = "" />
		<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Activity
				SET
					ParentActivityID = <cfqueryparam value="#arguments.Activity.getParentActivityID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Activity.getParentActivityID())#" />,
					ActivityTypeID = <cfqueryparam value="#arguments.Activity.getActivityTypeID()#" CFSQLType="cf_sql_integer" />,
					GroupingID = <cfqueryparam value="#arguments.Activity.getGroupingID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Activity.getGroupingID())#" />,
					Title = <cfqueryparam value="#arguments.Activity.getTitle()#" CFSQLType="cf_sql_varchar" />,
					Description = <cfqueryparam value="#arguments.Activity.getDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Activity.getDescription())#" />,
					ReleaseDate = <cfqueryparam value="#arguments.Activity.getReleaseDate()#" CFSQLType="cf_sql_timestamp" />,
					StartDate = <cfqueryparam value="#arguments.Activity.getStartDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Activity.getStartDate())#" />,
					EndDate = <cfqueryparam value="#arguments.Activity.getEndDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Activity.getEndDate())#" />,
					LocationID = <cfqueryparam value="#arguments.Activity.getLocationID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Activity.getLocationID())#" />,
					Location = <cfqueryparam value="#arguments.Activity.getLocation()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Activity.getLocation())#" />,
					Address1 = <cfqueryparam value="#arguments.Activity.getAddress1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Activity.getAddress1())#" />,
					Address2 = <cfqueryparam value="#arguments.Activity.getAddress2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Activity.getAddress2())#" />,
					City = <cfqueryparam value="#arguments.Activity.getCity()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Activity.getCity())#" />,
					State = <cfqueryparam value="#arguments.Activity.getState()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Activity.getState())#" />,
					Country = <cfqueryparam value="#arguments.Activity.getCountry()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Activity.getCountry())#" />,
					PostalCode = <cfqueryparam value="#arguments.Activity.getPostalCode()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Activity.getPostalCode())#" />,
					SessionType = <cfqueryparam value="#arguments.Activity.getSessionType()#" CFSQLType="cf_sql_char" null="#not len(arguments.Activity.getSessionType())#" />,
					StatusID = <cfqueryparam value="#arguments.Activity.getStatusID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Activity.getStatusID())#" />,
					StatMaxRegistrants = <cfqueryparam value="#arguments.Activity.getStatMaxRegistrants()#" CFSQLType="cf_sql_float" null="#not len(arguments.Activity.getStatMaxRegistrants())#" />,
					StatAttendees = <cfqueryparam value="#arguments.Activity.getStatAttendees()#" CFSQLType="cf_sql_float" null="#not len(arguments.Activity.getStatAttendees())#" />,
					StatAddlAttendees = <cfqueryparam value="#arguments.Activity.getStatAddlAttendees()#" CFSQLType="cf_sql_float" null="#not len(arguments.Activity.getStatAddlAttendees())#" />,
					StatCMEHours = <cfqueryparam value="#arguments.Activity.getStatCMEHours()#" CFSQLType="cf_sql_float" null="#not len(arguments.Activity.getStatCMEHours())#" />,
					StatMD = <cfqueryparam value="#arguments.Activity.getStatMD()#" CFSQLType="cf_sql_float" null="#not len(arguments.Activity.getStatMD())#" />,
					StatNonMD = <cfqueryparam value="#arguments.Activity.getStatNonMD()#" CFSQLType="cf_sql_float" null="#not len(arguments.Activity.getStatNonMD())#" />,
					StatSupporters = <cfqueryparam value="#arguments.Activity.getStatSupporters()#" CFSQLType="cf_sql_float" null="#not len(arguments.Activity.getStatSupporters())#" />,
					StatSuppAmount = <cfqueryparam value="#arguments.Activity.getStatSuppAmount()#" CFSQLType="cf_sql_float" null="#not len(arguments.Activity.getStatSuppAmount())#" />,
					Sponsorship = <cfqueryparam value="#arguments.Activity.getSponsorship()#" CFSQLType="cf_sql_char" null="#not len(arguments.Activity.getSponsorship())#" />,
					Sponsor = <cfqueryparam value="#arguments.Activity.getSponsor()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Activity.getSponsor())#" />,
					ExternalID = <cfqueryparam value="#arguments.Activity.getExternalID()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Activity.getExternalID())#" />,
					Created = <cfqueryparam value="#arguments.Activity.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Activity.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.Activity.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Activity.getCreatedBy())#" />,
					Updated = <cfqueryparam value="#arguments.Activity.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Activity.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.Activity.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Activity.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.Activity.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Activity.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.Activity.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Activity.getDeletedFlag())#" />
				WHERE	ActivityID = <cfqueryparam value="#arguments.Activity.getActivityID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
		<cftry>
			
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="Activity" type="_com.Activity.Activity" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Activity 
				WHERE	ActivityID = <cfqueryparam value="#arguments.Activity.getActivityID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="Activity" type="_com.Activity.Activity" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Activity
			WHERE	ActivityID = <cfqueryparam value="#arguments.Activity.getActivityID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="Activity" type="_com.Activity.Activity" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.Activity)>
			<cfset success = update(arguments.Activity) />
		<cfelse>
			<cfset success = create(arguments.Activity) />
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
