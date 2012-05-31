
<cfcomponent displayname="ActivityGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.Activity.ActivityGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="ParentActivityID" type="numeric" required="false" />
		<cfargument name="ActivityTypeID" type="numeric" required="false" />
		<cfargument name="GroupingID" type="numeric" required="false" />
		<cfargument name="Title" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="ReleaseDate" type="date" required="false" />
		<cfargument name="StartDate" type="date" required="false" />
		<cfargument name="EndDate" type="date" required="false" />
		<cfargument name="LocationID" type="numeric" required="false" />
		<cfargument name="Location" type="string" required="false" />
		<cfargument name="Address1" type="string" required="false" />
		<cfargument name="Address2" type="string" required="false" />
		<cfargument name="City" type="string" required="false" />
		<cfargument name="State" type="string" required="false" />
		<cfargument name="PostalCode" type="string" required="false" />
		<cfargument name="SessionType" type="string" required="false" />
		<cfargument name="StatusID" type="numeric" required="false" />
		<cfargument name="StatMaxRegistrants" type="numeric" required="false" />
		<cfargument name="StatAttendees" type="numeric" required="false" />
		<cfargument name="StatAddlAttendees" type="numeric" required="false" />
		<cfargument name="StatCMEHours" type="numeric" required="false" />
		<cfargument name="StatMD" type="numeric" required="false" />
		<cfargument name="StatNonMD" type="numeric" required="false" />
		<cfargument name="StatSupporters" type="numeric" required="false" />
		<cfargument name="StatSuppAmount" type="numeric" required="false" />
		<cfargument name="Sponsorship" type="string" required="false" />
		<cfargument name="Sponsor" type="string" required="false" />
		<cfargument name="ExternalID" type="string" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
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
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ParentActivityID") and len(arguments.ParentActivityID)>
			AND	ParentActivityID = <cfqueryparam value="#arguments.ParentActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityTypeID") and len(arguments.ActivityTypeID)>
			AND	ActivityTypeID = <cfqueryparam value="#arguments.ActivityTypeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"GroupingID") and len(arguments.GroupingID)>
			AND	GroupingID = <cfqueryparam value="#arguments.GroupingID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Title") and len(arguments.Title)>
			AND	Title = <cfqueryparam value="#arguments.Title#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Description") and len(arguments.Description)>
			AND	Description = <cfqueryparam value="#arguments.Description#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ReleaseDate") and len(arguments.ReleaseDate)>
			AND	ReleaseDate = <cfqueryparam value="#arguments.ReleaseDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"StartDate") and len(arguments.StartDate)>
			AND	StartDate = <cfqueryparam value="#arguments.StartDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"EndDate") and len(arguments.EndDate)>
			AND	EndDate = <cfqueryparam value="#arguments.EndDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"LocationID") and len(arguments.LocationID)>
			AND	LocationID = <cfqueryparam value="#arguments.LocationID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Location") and len(arguments.Location)>
			AND	Location = <cfqueryparam value="#arguments.Location#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Address1") and len(arguments.Address1)>
			AND	Address1 = <cfqueryparam value="#arguments.Address1#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Address2") and len(arguments.Address2)>
			AND	Address2 = <cfqueryparam value="#arguments.Address2#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"City") and len(arguments.City)>
			AND	City = <cfqueryparam value="#arguments.City#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"State") and len(arguments.State)>
			AND	State = <cfqueryparam value="#arguments.State#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"PostalCode") and len(arguments.PostalCode)>
			AND	PostalCode = <cfqueryparam value="#arguments.PostalCode#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"SessionType") and len(arguments.SessionType)>
			AND	SessionType = <cfqueryparam value="#arguments.SessionType#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"StatusID") and len(arguments.StatusID)>
			AND	StatusID = <cfqueryparam value="#arguments.StatusID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"StatMaxRegistrants") and len(arguments.StatMaxRegistrants)>
			AND	StatMaxRegistrants = <cfqueryparam value="#arguments.StatMaxRegistrants#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"StatAttendees") and len(arguments.StatAttendees)>
			AND	StatAttendees = <cfqueryparam value="#arguments.StatAttendees#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"StatAddlAttendees") and len(arguments.StatAddlAttendees)>
			AND	StatAddlAttendees = <cfqueryparam value="#arguments.StatAddlAttendees#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"StatCMEHours") and len(arguments.StatCMEHours)>
			AND	StatCMEHours = <cfqueryparam value="#arguments.StatCMEHours#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"StatMD") and len(arguments.StatMD)>
			AND	StatMD = <cfqueryparam value="#arguments.StatMD#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"StatNonMD") and len(arguments.StatNonMD)>
			AND	StatNonMD = <cfqueryparam value="#arguments.StatNonMD#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"StatSupporters") and len(arguments.StatSupporters)>
			AND	StatSupporters = <cfqueryparam value="#arguments.StatSupporters#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"StatSuppAmount") and len(arguments.StatSuppAmount)>
			AND	StatSuppAmount = <cfqueryparam value="#arguments.StatSuppAmount#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"Sponsorship") and len(arguments.Sponsorship)>
			AND	Sponsorship = <cfqueryparam value="#arguments.Sponsorship#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"Sponsor") and len(arguments.Sponsor)>
			AND	Sponsor = <cfqueryparam value="#arguments.Sponsor#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ExternalID") and len(arguments.ExternalID)>
			AND	ExternalID = <cfqueryparam value="#arguments.ExternalID#" CFSQLType="cf_sql_varchar" />
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
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
	
	<cffunction name="getByReportAttributes" access="public" output="false" returntype="query">
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="ParentActivityID" type="numeric" required="false" />
		<cfargument name="ActivityTypeID" type="numeric" required="false" />
		<cfargument name="GroupingID" type="numeric" required="false" />
		<cfargument name="Title" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="ReleaseDate" type="date" required="false" />
		<cfargument name="StartDate" type="date" required="false" />
		<cfargument name="EndDate" type="date" required="false" />
		<cfargument name="LocationID" type="numeric" required="false" />
		<cfargument name="Location" type="string" required="false" />
		<cfargument name="Address1" type="string" required="false" />
		<cfargument name="Address2" type="string" required="false" />
		<cfargument name="City" type="string" required="false" />
		<cfargument name="State" type="string" required="false" />
		<cfargument name="PostalCode" type="string" required="false" />
		<cfargument name="SessionType" type="string" required="false" />
		<cfargument name="StatusID" type="numeric" required="false" />
		<cfargument name="StatMaxRegistrants" type="numeric" required="false" />
		<cfargument name="StatAttendees" type="numeric" required="false" />
		<cfargument name="StatAddlAttendees" type="numeric" required="false" />
		<cfargument name="StatCMEHours" type="numeric" required="false" />
		<cfargument name="StatMD" type="numeric" required="false" />
		<cfargument name="StatNonMD" type="numeric" required="false" />
		<cfargument name="StatSupporters" type="numeric" required="false" />
		<cfargument name="StatSuppAmount" type="numeric" required="false" />
		<cfargument name="Sponsorship" type="string" required="false" />
		<cfargument name="Sponsor" type="string" required="false" />
		<cfargument name="ExternalID" type="string" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				a.ActivityID,
				a.ParentActivityID,
				a.ActivityTypeID,
				a.GroupingID,
				a.Title,
				a.Description,
				a.StartDate,
				a.EndDate,
				a.SessionType,
				a.StatusID,
				a.Sponsorship,
				a.Sponsor,
				a.ExternalID,
				a.Deleted,
				a.DeletedFlag
			FROM	ce_Activity a
			WHERE	
            	a.SessionType = 'S'
				AND (a.StatusID IN (1,2,3))
                AND a.DeletedFlag = 'N'
                <cfif structKeyExists(arguments,"AssessTypeID") AND len(arguments.AssessTypeID)>
                    AND (SELECT Count(AssessmentID)
                         FROM ce_Assessment
                         WHERE ActivityID = a.ActivityID AND AssessTypeID = <cfqueryparam value="#arguments.AssessTypeID#" cfsqltype="cf_sql_integer" />) > 0
                </cfif>
				<cfif structKeyExists(arguments,"StartDate") and len(arguments.StartDate)>
					AND	a.StartDate BETWEEN <cfqueryparam value="#arguments.StartDate#" CFSQLType="cf_sql_timestamp" /> AND <cfqueryparam value="#arguments.EndDate#" CFSQLType="cf_sql_timestamp" />
                </cfif>
				<cfif structKeyExists(arguments,"Sponsor") and len(arguments.Sponsor)>
                    AND a.Sponsor = <cfqueryparam value="#arguments.Sponsor#" cfsqltype="cf_sql_varchar" />
                </cfif>
                <cfif structKeyExists(arguments,"CategoryID") and len(arguments.CategoryID)>
                	AND (SELECT COUNT(ActivityID)
                    	 FROM ce_Activity_Category ac
                         WHERE ac.ActivityID = a.ActivityID AND ac.CategoryID = <cfqueryparam value="#arguments.CategoryID#" cfsqltype="cf_sql_integer" />) > 0
                </cfif>
                <cfif structKeyExists(arguments,"NeedAssessments") and len(arguments.NeedAssessments)>
                	AND (SELECT COUNT(AssessmentID)
                    	 FROM ce_Assessment ass
                         WHERE ass.ActivityID = a.ActivityID AND ass.DeletedFlag = 'N') > 0
                </cfif>
            OR		a.SessionType = 'M'
                AND a.ParentActivityID IS NOT NULL
				AND (a.StatusID IN (1,2,3))
                AND a.DeletedFlag = 'N'
                <cfif structKeyExists(arguments,"AssessTypeID") AND len(arguments.AssessTypeID)>
                    AND (SELECT Count(AssessmentID)
                         FROM ce_Assessment
                         WHERE ActivityID = a.ActivityID AND AssessTypeID = <cfqueryparam value="#arguments.AssessTypeID#" cfsqltype="cf_sql_integer" />) > 0
                </cfif>
				<cfif structKeyExists(arguments,"StartDate") and len(arguments.StartDate)>
					AND	a.StartDate BETWEEN <cfqueryparam value="#arguments.StartDate#" CFSQLType="cf_sql_timestamp" /> AND <cfqueryparam value="#arguments.EndDate#" CFSQLType="cf_sql_timestamp" />
                </cfif>
				<cfif structKeyExists(arguments,"Sponsor") and len(arguments.Sponsor)>
                    AND a.Sponsor = <cfqueryparam value="#arguments.Sponsor#" cfsqltype="cf_sql_varchar" />
                </cfif>
                <cfif structKeyExists(arguments,"CategoryID") and len(arguments.CategoryID)>
                	AND (SELECT COUNT(ActivityID)
                    	 FROM ce_Activity_Category ac
                         WHERE ac.ActivityID = a.ActivityID AND ac.CategoryID = <cfqueryparam value="#arguments.CategoryID#" cfsqltype="cf_sql_integer" />) > 0
                </cfif>
                <cfif structKeyExists(arguments,"NeedAssessments") and len(arguments.NeedAssessments)>
                	AND (SELECT COUNT(AssessmentID)
                    	 FROM ce_Assessment ass
                         WHERE ass.ActivityID = a.ActivityID AND ass.DeletedFlag = 'N') > 0
                </cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
	
	<cffunction name="getByCDCAttributes" access="public" output="false" returntype="query">
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="ParentActivityID" type="numeric" required="false" />
		<cfargument name="ActivityTypeID" type="numeric" required="false" />
		<cfargument name="GroupingID" type="numeric" required="false" />
		<cfargument name="Title" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="ReleaseDate" type="date" required="false" />
		<cfargument name="StartDate" type="date" required="false" />
		<cfargument name="EndDate" type="date" required="false" />
		<cfargument name="LocationID" type="numeric" required="false" />
		<cfargument name="Location" type="string" required="false" />
		<cfargument name="Address1" type="string" required="false" />
		<cfargument name="Address2" type="string" required="false" />
		<cfargument name="City" type="string" required="false" />
		<cfargument name="State" type="string" required="false" />
		<cfargument name="PostalCode" type="string" required="false" />
		<cfargument name="SessionType" type="string" required="false" />
		<cfargument name="StatusID" type="numeric" required="false" />
		<cfargument name="StatMaxRegistrants" type="numeric" required="false" />
		<cfargument name="StatAttendees" type="numeric" required="false" />
		<cfargument name="StatAddlAttendees" type="numeric" required="false" />
		<cfargument name="StatCMEHours" type="numeric" required="false" />
		<cfargument name="StatMD" type="numeric" required="false" />
		<cfargument name="StatNonMD" type="numeric" required="false" />
		<cfargument name="StatSupporters" type="numeric" required="false" />
		<cfargument name="StatSuppAmount" type="numeric" required="false" />
		<cfargument name="Sponsorship" type="string" required="false" />
		<cfargument name="Sponsor" type="string" required="false" />
		<cfargument name="ExternalID" type="string" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				a.ActivityID,
				a.ParentActivityID,
				a.ActivityTypeID,
				a.GroupingID,
				a.Title,
				a.Description,
				a.ReleaseDate,
				a.StartDate,
				a.EndDate,
				a.SessionType,
				a.StatusID,
				a.Sponsorship,
				a.Sponsor,
				a.ExternalID,
				a.Deleted,
				a.DeletedFlag
			FROM	ce_Activity a
            INNER JOIN ce_Activity_Category ac ON ac.ActivityID = a.ActivityID
            INNER JOIN ce_Category c ON c.CategoryID = ac.CategoryID
			WHERE	c.Name = 'STD/HIV'
                AND a.Sponsorship = 'J'
                AND a.SessionType = 'M'
                AND a.ParentActivityID IS NOT NULL
				AND (a.StatusID IN (1,2,3))
                <cfif structKeyExists(arguments,"AssessTypeID") AND len(arguments.AssessTypeID)>
                    AND (SELECT Count(AssessmentID)
                         FROM ce_Assessment
                         WHERE ActivityID = a.ActivityID AND AssessTypeID = <cfqueryparam value="#arguments.AssessTypeID#" cfsqltype="cf_sql_integer" />) > 0
                </cfif>
				<cfif structKeyExists(arguments,"ReleaseDate") and len(arguments.ReleaseDate)>
					AND	ReleaseDate BETWEEN <cfqueryparam value="#arguments.ReleaseDate#" CFSQLType="cf_sql_timestamp" /> AND <cfqueryparam value="#arguments.EndDate#" CFSQLType="cf_sql_timestamp" />
                </cfif>
				<cfif structKeyExists(arguments,"Sponsor") and len(arguments.Sponsor)>
                    AND a.Sponsor = <cfqueryparam value="#arguments.Sponsor#" cfsqltype="cf_sql_varchar" />
                </cfif>
            OR		c.Name = 'STD/HIV'
                AND a.Sponsorship = 'D'
                AND a.SessionType = 'M'
                AND a.ParentActivityID IS NOT NULL
				AND (a.StatusID IN (1,2,3))
                <cfif structKeyExists(arguments,"AssessTypeID") AND len(arguments.AssessTypeID)>
                    AND (SELECT Count(AssessmentID)
                         FROM ce_Assessment
                         WHERE ActivityID = a.ActivityID AND AssessTypeID = <cfqueryparam value="#arguments.AssessTypeID#" cfsqltype="cf_sql_integer" />) > 0
                </cfif>
				<cfif structKeyExists(arguments,"ReleaseDate") and len(arguments.ReleaseDate)>
					AND	ReleaseDate BETWEEN <cfqueryparam value="#arguments.ReleaseDate#" CFSQLType="cf_sql_timestamp" /> AND <cfqueryparam value="#arguments.EndDate#" CFSQLType="cf_sql_timestamp" />
                </cfif>
				<cfif structKeyExists(arguments,"Sponsor") and len(arguments.Sponsor)>
                    AND a.Sponsor = 'Cincinnati STD/HIV Prevention Training Center'
                </cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
    
	<cffunction name="getByViewAttributes" access="public" output="false" returntype="query">
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="ParentActivityID" type="numeric" required="false" />
		<cfargument name="ActivityTypeID" type="numeric" required="false" />
		<cfargument name="GroupingID" type="numeric" required="false" />
		<cfargument name="Title" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="ReleaseDate" type="date" required="false" />
		<cfargument name="StartDate" type="date" required="false" />
		<cfargument name="EndDate" type="date" required="false" />
		<cfargument name="LocationID" type="numeric" required="false" />
		<cfargument name="Location" type="string" required="false" />
		<cfargument name="Address1" type="string" required="false" />
		<cfargument name="Address2" type="string" required="false" />
		<cfargument name="City" type="string" required="false" />
		<cfargument name="State" type="string" required="false" />
		<cfargument name="PostalCode" type="string" required="false" />
		<cfargument name="SessionType" type="string" required="false" />
		<cfargument name="StatAttendees" type="numeric" required="false" />
		<cfargument name="StatMD" type="numeric" required="false" />
		<cfargument name="StatNonMD" type="numeric" required="false" />
		<cfargument name="StatSupporters" type="numeric" required="false" />
		<cfargument name="StatSuppAmount" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				a.ActivityID,
				a.ParentActivityID,
				a.ActivityTypeID,
				a.GroupingID,
				a.StatusID,
				a.ExternalID,
				a.Sponsorship,
				a.Sponsor,
				a.Title,
				a.Description,
				a.ReleaseDate,
				a.StartDate,
				a.EndDate,
				a.LocationID,
				a.Location,
				a.Address1,
				a.Address2,
				a.City,
				a.State,
				a.PostalCode,
				a.SessionType,
				a.StatAttendees,
				a.StatMD,
				a.StatNonMD,
				a.StatSupporters,
				a.StatSuppAmount,
				a.Created,
				a.Updated,
				a.Deleted,
				a.DeletedFlag,
				p1.FirstName AS CreatedByFName,
				p1.LastName AS CreatedByLName,
				p2.FirstName AS UpdatedByFName,
				p2.LastName AS UpdatedByLName
			FROM	ce_Activity a
			INNER JOIN ce_Person p1 ON p1.PersonID = a.CreatedBy
			INNER JOIN ce_Person p2 ON p2.PersonID = a.UpdatedBy
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	a.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ParentActivityID") and len(arguments.ParentActivityID)>
			AND	a.ParentActivityID = <cfqueryparam value="#arguments.ParentActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityTypeID") and len(arguments.ActivityTypeID)>
			AND	a.ActivityTypeID = <cfqueryparam value="#arguments.ActivityTypeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"GroupingID") and len(arguments.GroupingID)>
			AND	a.GroupingID = <cfqueryparam value="#arguments.GroupingID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Title") and len(arguments.Title)>
			AND	a.Title = <cfqueryparam value="#arguments.Title#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Description") and len(arguments.Description)>
			AND	a.Description = <cfqueryparam value="#arguments.Description#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ReleaseDate") and len(arguments.ReleaseDate)>
			AND	a.ReleaseDate <= <cfqueryparam value="#arguments.ReleaseDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"StartDate") and len(arguments.StartDate)>
			AND	a.StartDate = <cfqueryparam value="#arguments.StartDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"EndDate") and len(arguments.EndDate)>
			AND	a.EndDate >= <cfqueryparam value="#arguments.EndDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"LocationID") and len(arguments.LocationID)>
			AND	a.LocationID = <cfqueryparam value="#arguments.LocationID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Location") and len(arguments.Location)>
			AND	a.Location = <cfqueryparam value="#arguments.Location#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Address1") and len(arguments.Address1)>
			AND	a.Address1 = <cfqueryparam value="#arguments.Address1#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Address2") and len(arguments.Address2)>
			AND	a.Address2 = <cfqueryparam value="#arguments.Address2#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"City") and len(arguments.City)>
			AND	a.City = <cfqueryparam value="#arguments.City#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"State") and len(arguments.State)>
			AND	a.State = <cfqueryparam value="#arguments.State#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"PostalCode") and len(arguments.PostalCode)>
			AND	a.PostalCode = <cfqueryparam value="#arguments.PostalCode#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"SessionType") and len(arguments.SessionType)>
			AND	a.SessionType = <cfqueryparam value="#arguments.SessionType#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"StatAttendees") and len(arguments.StatAttendees)>
			AND	a.StatAttendees = <cfqueryparam value="#arguments.StatAttendees#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"StatMD") and len(arguments.StatMD)>
			AND	a.StatMD = <cfqueryparam value="#arguments.StatMD#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"StatNonMD") and len(arguments.StatNonMD)>
			AND	a.StatNonMD = <cfqueryparam value="#arguments.StatNonMD#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"StatSupporters") and len(arguments.StatSupporters)>
			AND	a.StatSupporters = <cfqueryparam value="#arguments.StatSupporters#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"StatSuppAmount") and len(arguments.StatSuppAmount)>
			AND	a.StatSuppAmount = <cfqueryparam value="#arguments.StatSuppAmount#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	a.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	a.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	a.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	a.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	a.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	a.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
	
	<cffunction name="getBySearch" access="public" output="false" returntype="query">
		<cfargument name="ActivityTypeID" type="numeric" required="false" />
		<cfargument name="CategoryID" type="numeric" required="false" />
		<cfargument name="GroupingID" type="numeric" required="false" />
		<cfargument name="Title" type="string" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="Limit" type="string" required="false" default="" />
		<cfargument name="OrderBy" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#application.settings.dsn#" result="QueryInfo">
			SELECT <cfif Arguments.Limit NEQ "">TOP #Arguments.Limit#</cfif>
				C.ActivityID, 
                C.ParentActivityID, 
                C.ActivityTypeID, 
                CT.Name AS ActivityTypeName, 
                C.GroupingID, 
                G.Name AS GroupingName, 
                C.Title, 
                C.Description, 
			  	C.StartDate, 
                C.Created, 
                C.CreatedBy, 
                P1.firstname + ' ' + P1.lastname AS CreatedByName, 
                C.Updated, 
                C.UpdatedBy, 
			  	P2.firstname + ' ' + P2.lastname AS UpdatedByName, 
                C.Deleted, C.DeletedFlag, 
                S.Name As StatusName, 
                S.StatusID
			FROM ce_Sys_Status AS S 
            RIGHT OUTER JOIN ce_Activity AS C ON S.StatusID = C.StatusID 
            LEFT OUTER JOIN ce_Sys_ActivityType AS CT ON C.ActivityTypeID = CT.ActivityTypeID 
            LEFT OUTER JOIN ce_Sys_Grouping AS G ON C.GroupingID = G.GroupingID 
            LEFT OUTER JOIN ce_person AS P1 ON C.CreatedBy = P1.personid 
          	LEFT OUTER JOIN ce_person AS P2 ON C.UpdatedBy = P2.personid
			WHERE     (0 = 0)
		<cfif structKeyExists(arguments,"ActivityTypeID") and len(arguments.ActivityTypeID) AND arguments.ActivityTypeID GT 0>
			AND	C.ActivityTypeID = <cfqueryparam value="#arguments.ActivityTypeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"GroupingID") and len(arguments.GroupingID) AND arguments.GroupingID GT 0>
			AND	C.GroupingID = <cfqueryparam value="#arguments.GroupingID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CategoryID") and len(arguments.CategoryID) AND arguments.CategoryID GT 0>
			AND	(SELECT Count(AC.Activity_CategoryID) FROM ce_Activity_Category AC WHERE AC.CategoryID=<cfqueryparam value="#Arguments.CategoryID#" cfsqltype="cf_sql_integer" /> AND AC.DeletedFlag='N' AND AC.ActivityID=C.ActivityID) > 0
		</cfif>
		<cfif structKeyExists(arguments,"Title") and len(arguments.Title)>
			AND	C.Title LIKE <cfqueryparam value="%#arguments.Title#%" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"StartDate") and len(arguments.StartDate)>
			AND	C.StartDate BETWEEN <cfqueryparam value="#arguments.StartDate# 00:00:00" CFSQLType="cf_sql_date" /> AND <cfqueryparam value="#arguments.StartDate# 23:59:59" CFSQLType="cf_sql_date" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy) AND arguments.CreatedBy GT 0>
			AND	C.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy) AND arguments.UpdatedBy GT 0>
			AND	C.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		 AND C.DeletedFlag='N'
		<cfif structKeyExists(arguments, "OrderBy") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
        
		<cfreturn qList />
	</cffunction>
	
	<cffunction name="getBySearchLMS" access="public" output="false" returntype="query">
		<cfargument name="ActivityTypeID" type="numeric" required="false" />
		<cfargument name="CategoryID" type="string" required="false" />
		<cfargument name="TagID" type="string" required="false" />
		<cfargument name="GroupingID" type="numeric" required="false" />
		<cfargument name="SpecialtyID" type="string" required="false" />
		<cfargument name="CategoryLMSID" type="string" required="false" />
		<cfargument name="Title" type="string" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="FeaturedFlag" type="string" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="MyPersonID" type="string" required="false" />
		<cfargument name="Limit" type="string" required="false" default="" />
		<cfargument name="PublishedFlag" type="string" required="false" default="Y" />
		
		<!--- PERSON / STATUS --->
		<cfargument name="PersonID" type="string" required="false" />
		<cfargument name="StatusID" type="string" required="false" />
		
		<cfargument name="OrderBy" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#application.settings.dsn#" result="QueryInfo">
				SELECT <cfif Arguments.Limit NEQ "">TOP #Arguments.Limit#</cfif>
					C.ActivityID, 
                    C.ParentActivityID, 
                    C.ActivityTypeID, 
					CT.Name AS ActivityTypeName, 
                    C.GroupingID, 
					G.Name AS GroupingName, 
                    C.Title, 
                    C.Description, 
					C.ReleaseDate, 
					C.StartDate,
                    C.EndDate, 
                    C.Created, 
					C.CreatedBy, 
                    C.Updated, 
                    C.UpdatedBy, 
					C.Deleted,
                    C.DeletedFlag, 
                    S.Name AS StatusName, 
					S.StatusID, 
                    ACP.LinkName,Permalink = 
                        CASE isNull(ACP.LinkName,'0')
                            WHEN '0' THEN
                                'http://ccpd.uc.edu/activity/' + CAST(C.ActivityID As varchar)
                            WHEN '' THEN
                                'http://ccpd.uc.edu/activity/' + CAST(C.ActivityID As varchar)
                            ELSE
                                'http://ccpd.uc.edu/activity/' + ACP.LinkName
                        END,
                        ACP.PaymentFlag, 
					ACP.StatVoteValue, 
                    ACP.StatVoteCount, 
					ACP.Overview, 
                    ACP.PublishDate, 
                    ACP.RemoveDate, 
					ACP.FeaturedFlag, 
					C.Updated,
                    StatRank = 
                        CASE ACP.StatVoteCount
                            WHEN 0 THEN 0
                            ELSE isNull(ACP.StatVoteValue / ACP.StatVoteCount,0)
                        END,
                    <cfif structKeyExists(arguments,"MyPersonID") and len(arguments.MyPersonID) AND arguments.MyPersonID GT 0>
                    ISNULL((SELECT TOP 1 Att3.StatusID
                              FROM         ce_Attendee Att3
                              WHERE (Att3.ActivityID = C.ActivityID) AND (Att3.PersonID = <cfqueryparam value="#Arguments.MyPersonID#" cfsqltype="cf_sql_integer" />)), 0) AS MyStatus
                    <cfelse>
                    0 As MyStatus
                    </cfif>
                FROM ce_Sys_Status AS S 
                RIGHT OUTER JOIN ce_Activity AS C ON S.StatusID = C.StatusID 
                LEFT OUTER JOIN ce_Sys_ActivityType AS CT ON C.ActivityTypeID = CT.ActivityTypeID 
                LEFT OUTER JOIN ce_Sys_Grouping AS G ON C.GroupingID = G.GroupingID 
                INNER JOIN ce_Activity_PubGeneral AS ACP ON ACP.ActivityID = C.ActivityID
                WHERE 
            	((0 = 0)
				<cfif structKeyExists(arguments,"ActivityTypeID") and len(arguments.ActivityTypeID) AND arguments.ActivityTypeID GT 0>
                    AND	C.ActivityTypeID = <cfqueryparam value="#arguments.ActivityTypeID#" CFSQLType="cf_sql_integer" />
                </cfif>
                <cfif structKeyExists(arguments,"GroupingID") and len(arguments.GroupingID) AND arguments.GroupingID GT 0>
                    AND	C.GroupingID = <cfqueryparam value="#arguments.GroupingID#" CFSQLType="cf_sql_integer" />
                </cfif>
				<cfif structKeyExists(arguments,"SpecialtyID") and len(arguments.SpecialtyID) AND arguments.SpecialtyID GT 0>
                    AND	(SELECT Count(Activity_LMS_SpecialtyID) FROM ce_Activity_SpecialtyLMS ActS WHERE ActS.ActivityID=C.ActivityID AND ActS.SpecialtyID = <cfqueryparam value="#arguments.SpecialtyID#" CFSQLType="cf_sql_integer" />) > 0
                </cfif>
				<cfif structKeyExists(arguments,"CategoryLMSID") and len(arguments.CategoryLMSID) AND arguments.CategoryLMSID GT 0>
                    AND	(SELECT Count(Activity_LMS_CategoryID) FROM ce_Activity_CategoryLMS ActC WHERE ActC.ActivityID=C.ActivityID AND ActC.CategoryID = <cfqueryparam value="#arguments.CategoryLMSID#" CFSQLType="cf_sql_integer" />) > 0
                </cfif>
                <cfif structKeyExists(arguments,"CategoryID") and len(arguments.CategoryID) AND arguments.CategoryID GT 0>
                    AND	(SELECT Count(AC.Activity_CategoryID) FROM ce_Activity_Category AC WHERE AC.CategoryID=<cfqueryparam value="#Arguments.CategoryID#" cfsqltype="cf_sql_integer" /> AND AC.DeletedFlag='N' AND AC.ActivityID=C.ActivityID) > 0
                </cfif>
                <cfif structKeyExists(arguments,"TagID") and len(arguments.TagID) AND arguments.TagID GT 0>
                    AND	(SELECT Count(AC.activityid) FROM ce_Activity_Tag_relates AC WHERE AC.tagid=<cfqueryparam value="#Arguments.TagID#" cfsqltype="cf_sql_integer" /> AND AC.ActivityID=C.ActivityID) > 0
                </cfif>
                <cfif structKeyExists(arguments,"Title") and len(arguments.Title)>
                    AND	C.Title LIKE <cfqueryparam value="%#arguments.Title#%" CFSQLType="cf_sql_varchar" />
                </cfif>
                <cfif structKeyExists(arguments,"startDate") and len(arguments.startDate)>
                    AND	C.startDate BETWEEN <cfqueryparam value="#arguments.startDate# 00:00:00" CFSQLType="cf_sql_date" /> AND <cfqueryparam value="#arguments.startDate# 23:59:59" CFSQLType="cf_sql_date" />
                </cfif>
                <cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy) AND arguments.CreatedBy GT 0>
                    AND	C.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
                </cfif>
                <cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy) AND arguments.UpdatedBy GT 0>
                    AND	C.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
                </cfif>
				<cfif structKeyExists(arguments,"FeaturedFlag") and len(arguments.FeaturedFlag) AND arguments.FeaturedFlag GT 0>
                    AND	ACP.FeaturedFlag = <cfqueryparam value="#arguments.FeaturedFlag#" CFSQLType="cf_sql_varchar" />
                </cfif>
				<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID) AND arguments.PersonID GT 0 AND structKeyExists(arguments,"StatusID") and len(arguments.StatusID) AND arguments.StatusID GT 0>
					AND 
						 ((SELECT     COUNT(AttendeeID) AS Expr1
                              FROM         ce_Attendee
                              WHERE     (ActivityID = C.ActivityID) AND (PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_varchar" />) AND (StatusID = <cfqueryparam value="#arguments.StatusID#" CFSQLType="cf_sql_varchar" />)) > 0)
				</cfif>
				AND C.DeletedFlag = 'N'
				<cfif Arguments.PublishedFlag EQ "Y">
                AND C.StatusID = 1
                AND ACP.PublishDate <= GetDate()
                AND ACP.RemoveDate IS NULL
				</cfif>
               	)
            <cfif Arguments.PublishedFlag EQ "Y">
			OR
                ((0 = 0)
               <cfif structKeyExists(arguments,"ActivityTypeID") and len(arguments.ActivityTypeID) AND arguments.ActivityTypeID GT 0>
                    AND	C.ActivityTypeID = <cfqueryparam value="#arguments.ActivityTypeID#" CFSQLType="cf_sql_integer" />
                </cfif>
                <cfif structKeyExists(arguments,"GroupingID") and len(arguments.GroupingID) AND arguments.GroupingID GT 0>
                    AND	C.GroupingID = <cfqueryparam value="#arguments.GroupingID#" CFSQLType="cf_sql_integer" />
                </cfif>
				<cfif structKeyExists(arguments,"SpecialtyID") and len(arguments.SpecialtyID) AND arguments.SpecialtyID GT 0>
                    AND	(SELECT Count(Activity_LMS_SpecialtyID) FROM ce_Activity_SpecialtyLMS ActS WHERE ActS.ActivityID=C.ActivityID AND ActS.SpecialtyID = <cfqueryparam value="#arguments.SpecialtyID#" CFSQLType="cf_sql_integer" />) > 0
                </cfif>
				<cfif structKeyExists(arguments,"CategoryLMSID") and len(arguments.CategoryLMSID) AND arguments.CategoryLMSID GT 0>
                    AND	(SELECT Count(Activity_LMS_CategoryID) FROM ce_Activity_CategoryLMS ActC WHERE ActC.ActivityID=C.ActivityID AND ActC.CategoryID = <cfqueryparam value="#arguments.CategoryLMSID#" CFSQLType="cf_sql_integer" />) > 0
                </cfif>
                <cfif structKeyExists(arguments,"CategoryID") and len(arguments.CategoryID) AND arguments.CategoryID GT 0>
                    AND	(SELECT Count(AC.Activity_CategoryID) FROM ce_Activity_Category AC WHERE AC.CategoryID=<cfqueryparam value="#Arguments.CategoryID#" cfsqltype="cf_sql_integer" /> AND AC.DeletedFlag='N' AND AC.ActivityID=C.ActivityID) > 0
                </cfif>
                <cfif structKeyExists(arguments,"TagID") and len(arguments.TagID) AND arguments.TagID GT 0>
                    AND	(SELECT Count(AC.activityid) FROM ce_Activity_Tag_relates AC WHERE AC.tagid=<cfqueryparam value="#Arguments.TagID#" cfsqltype="cf_sql_integer" /> AND AC.ActivityID=C.ActivityID) > 0
                </cfif>
                <cfif structKeyExists(arguments,"Title") and len(arguments.Title)>
                    AND	C.Title LIKE <cfqueryparam value="%#arguments.Title#%" CFSQLType="cf_sql_varchar" />
                </cfif>
                <cfif structKeyExists(arguments,"ReleaseDate") and len(arguments.ReleaseDate)>
                    AND	C.ReleaseDate BETWEEN <cfqueryparam value="#arguments.ReleaseDate# 00:00:00" CFSQLType="cf_sql_date" /> AND <cfqueryparam value="#arguments.ReleaseDate# 23:59:59" CFSQLType="cf_sql_date" />
                </cfif>
                <cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy) AND arguments.CreatedBy GT 0>
                    AND	C.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
                </cfif>
                <cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy) AND arguments.UpdatedBy GT 0>
                    AND	C.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
                </cfif>
				<cfif structKeyExists(arguments,"FeaturedFlag") and len(arguments.FeaturedFlag) AND arguments.FeaturedFlag GT 0>
                    AND	ACP.FeaturedFlag = <cfqueryparam value="#arguments.FeaturedFlag#" CFSQLType="cf_sql_varchar" />
                </cfif>
				<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID) AND arguments.PersonID GT 0 AND structKeyExists(arguments,"StatusID") and len(arguments.StatusID) AND arguments.StatusID GT 0>
					AND 
						 ((SELECT     COUNT(AttendeeID) AS Expr1
                              FROM         ce_Attendee
                              WHERE     (ActivityID = C.ActivityID) AND (PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_varchar" />) AND (StatusID = <cfqueryparam value="#arguments.StatusID#" CFSQLType="cf_sql_varchar" />)) > 0)
				</cfif>
                AND C.DeletedFlag = 'N'
				<cfif Arguments.PublishedFlag EQ "Y">
                AND C.StatusID = 1
                AND ACP.PublishDate <= GetDate()
                AND ACP.RemoveDate > GetDate()
				</cfif>
                )
			</cfif>
		<cfif structKeyExists(arguments, "OrderBy") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
        
		
		
		<cfreturn qList />
	</cffunction>
	
	<cffunction name="getByCompletedList" access="public" output="false" returntype="query">
		<cfargument name="ActivityTypeID" type="numeric" required="false" />
		<cfargument name="CategoryID" type="string" required="false" />
		<cfargument name="GroupingID" type="numeric" required="false" />
		<cfargument name="SpecialtyID" type="string" required="false" />
		<cfargument name="CategoryLMSID" type="string" required="false" />
		<cfargument name="Title" type="string" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="FeaturedFlag" type="string" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="MyPersonID" type="string" required="false" />
		<cfargument name="Limit" type="string" required="false" default="" />
		<cfargument name="PublishedFlag" type="string" required="false" default="Y" />
		
		<!--- PERSON / STATUS --->
		<cfargument name="PersonID" type="string" required="false" />
		<cfargument name="StatusID" type="string" required="false" />
		<cfargument name="OrderBy" type="string" required="false" />
		
		<cfset var qList = "" />	
        	
		<cfquery name="qList" datasource="#application.settings.dsn#" result="QueryInfo">
				SELECT <!---<cfif Arguments.Limit NEQ "">TOP #Arguments.Limit#</cfif>--->
					C.ActivityID, 
                    C.ParentActivityID, 
                    C.ActivityTypeID, 
					CT.Name AS ActivityTypeName, 
                    C.GroupingID, 
					G.Name AS GroupingName, 
                    C.Title, 
                    C.Description, 
					C.ReleaseDate, 
					C.StartDate,
                    C.EndDate, 
                    C.Created, 
					C.CreatedBy, 
                    C.Updated, 
                    C.UpdatedBy, 
					C.Deleted,
                    C.DeletedFlag, 
                    S.Name AS StatusName, 
					S.StatusID, 
                    C.Updated,
                    ACP.LinkName,Permalink = 
                        CASE isNull(ACP.LinkName,'0')
                            WHEN '0' THEN
                                'http://ccpd.uc.edu/activity/' + CAST(C.ActivityID As varchar)
                            WHEN '' THEN
                                'http://ccpd.uc.edu/activity/' + CAST(C.ActivityID As varchar)
                            ELSE
                                'http://ccpd.uc.edu/activity/' + ACP.LinkName
                        END,
                        ACP.PaymentFlag, 
					ACP.StatVoteValue, 
                    ACP.StatVoteCount, 
					ACP.Overview, 
                    ACP.PublishDate, 
                    ACP.RemoveDate, 
					ACP.FeaturedFlag,
                    StatRank = 
                        CASE ACP.StatVoteCount
                            WHEN 0 THEN 0
                            ELSE isNull(ACP.StatVoteValue / ACP.StatVoteCount,0)
                        END,
                    <cfif structKeyExists(arguments,"MyPersonID") and len(arguments.MyPersonID) AND arguments.MyPersonID GT 0>
                    ISNULL((SELECT TOP 1 Att3.StatusID
                              FROM         ce_Attendee Att3
                              WHERE (Att3.ActivityID = C.ActivityID) AND (Att3.PersonID = <cfqueryparam value="#Arguments.MyPersonID#" cfsqltype="cf_sql_integer" />)), 0) AS MyStatus
                    <cfelse>
                    0 As MyStatus
                    </cfif>
                FROM ceschema.ce_Attendee AS att 
                INNER JOIN ceschema.ce_Activity AS C ON C.ActivityID = att.ActivityID
                LEFT OUTER JOIN ce_Sys_ActivityType AS CT ON C.ActivityTypeID = CT.ActivityTypeID 
                LEFT OUTER JOIN ce_Sys_Grouping AS G ON G.GroupingId = C.GroupingId
                LEFT OUTER JOIN ce_Sys_Status AS S ON S.statusId = C.statusId 
                LEFT OUTER JOIN ce_Activity_PubGeneral AS ACP ON ACP.ActivityID = C.ActivityID
                WHERE 
            	(
                	(0 = 0)
                    AND att.personId = <cfqueryparam value="#arguments.personId#" cfsqltype="cf_sql_integer" />
                    AND att.statusId = 1
                    AND att.deletedFlag = 'N'
                    AND C.DeletedFlag = 'N'
               	)
		<cfif structKeyExists(arguments, "OrderBy") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
</cfcomponent>