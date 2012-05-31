<cfcomponent>
	<cfinclude template="#Application.Settings.ComPath#/_UDF/isMD.cfm" />
    
	<cffunction name="refreshStats" access="remote" output="false" returntype="string">
		<cfargument name="ActivityID" type="numeric" required="yes">
        <cfargument name="Debug" type="numeric" required="no" default="0">
        
        <cfset var Status = "Fail|Cannot perform this action due to unknown reasons.">
        <cfset var CurrStatAttendees = 0>
        <cfset var CurrStatMD = 0>
        <cfset var CurrStatNonMD = 0>
        <cfset var CurrStatSupporters = 0>
        <cfset var CurrStatDollars = 0>
        
		<!--- GET ATTENDEES --->
        <cfquery name="AttendeeList" datasource="#Application.Settings.DSN#">
            SELECT PersonID, MDFlag
            FROM ce_Attendee
            WHERE ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND DeletedFlag = 'N' AND StatusID = 1
        </cfquery>
            
        <!--- GET MD STATS --->
        <cfloop query="AttendeeList">
        	<cfif isMD(personId=AttendeeList.PersonID)>
            	<cfset CurrStatMD = CurrStatMD + 1>
            <cfelse>
            	<cfset CurrStatNonMD = CurrStatNonMD + 1>
            </cfif>
        </cfloop>
        
   		<!--- GET SUPPORTER INFORMATION --->
        <cfquery name="SupporterList" datasource="#Application.Settings.DSN#">
        	SELECT SupportID, Amount
            FROM ce_Activity_FinSupport
            WHERE ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND DeletedFlag = 'N'
        </cfquery>
        
		<!--- UPDATE ATTENDEE COUNTS --->
        <cfset CurrStatAttendees = CurrStatAttendees + AttendeeList.RecordCount>
        
        <!--- UPDATE SUPPORTER STATS --->
        <cfset CurrStatSupporters = CurrStatSupporters + SupporterList.RecordCount>
        <cfloop query="SupporterList">
        	<cfset CurrStatDollars = CurrStatDollars + SupporterList.Amount>
        </cfloop>
        
        <!--- CHECK IF CURRENT ACTIVITY IS A PARENT --->
        <cfquery name="ActivityList" datasource="#Application.Settings.DSN#">
        	SELECT ActivityID
            FROM ce_Activity
            WHERE ParentActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND DeletedFlag = 'N'
        </cfquery>
        
        <!--- GET CHILDREN ACTIVITY STATS --->
        <cfif ActivityList.RecordCount GT 0>
        	<cfloop query="ActivityList">
            	<!--- GET ATTENDEES --->
            	<cfquery name="AttendeeList" datasource="#Application.Settings.DSN#">
                	SELECT PersonID, MDFlag
                    FROM ce_Attendee
                    WHERE ActivityID = <cfqueryparam value="#ActivityList.ActivityID#" cfsqltype="cf_sql_integer" /> AND DeletedFlag = 'N'
                </cfquery>
            
				<!--- GET MD STATS --->
                <cfloop query="AttendeeList">
                    <cfif isMD(personId=AttendeeList.PersonID)>
                        <cfset CurrStatMD = CurrStatMD + 1>
                    <cfelse>
                        <cfset CurrStatNonMD = CurrStatNonMD + 1>
                    </cfif>
                </cfloop>
        
        		<!--- GET SUPPORTER INFORMATION --->
                <cfquery name="SupporterList" datasource="#Application.Settings.DSN#">
                    SELECT SupportID, Amount
                    FROM ce_Activity_FinSupport
                    WHERE ActivityID = <cfqueryparam value="#ActivityList.ActivityID#" cfsqltype="cf_sql_integer" /> AND DeletedFlag = 'N'
                </cfquery>
                
                <!--- UPDATE ATTENDEE COUNTS --->
                <cfset CurrStatAttendees = CurrStatAttendees + AttendeeList.RecordCount>
                
				<!--- UPDATE SUPPORTER STATS --->
                <cfset CurrStatSupporters = CurrStatSupporters + SupporterList.RecordCount>
                <cfloop query="SupporterList">
                    <cfset CurrStatDollars = CurrStatDollars + SupporterList.Amount>
                </cfloop>
            </cfloop>
        </cfif>
        
        <cfif Arguments.Debug EQ 1>
            <cfdump var="MD:#CurrStatMD#"><br />
            <cfdump var="NonMD#CurrStatNonMD#"><br />
            <cfdump var="Attendees#CurrStatAttendees#"><br />
            <cfdump var="Supporters#CurrStatSupporters#"><br />
            <cfdump var="Support $:#CurrStatDollars#"><cfabort>
        </cfif>
        
        <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(ActivityID=Arguments.ActivityID)>
        <cfset ActivityBean = Application.Com.ActivityDAO.Read(ActivityBean)>
        
        <cfset ActivityBean.setStatAttendees(CurrStatAttendees)>
        <cfset ActivityBean.setStatMD(CurrStatMD)>
        <cfset ActivityBean.setStatNonMD(CurrStatNonMD)>
        <cfset ActivityBean.setStatSupporters(CurrStatSupporters)>
        <cfset ActivityBean.setStatSuppAmount(CurrStatDollars)>
        
        <cfset ActivitySaved = Application.Com.ActivityDAO.Save(ActivityBean)>
        
        <cfif ActivitySaved>
        	<cfset Status = "Success|Stats have been updated.">
        </cfif>
        
		<cfreturn Status />
	</cffunction>
	
	<cffunction name="getStat" access="public" output="no" returntype="numeric">
		<cfargument name="StatType" type="string" required="yes" />
		<cfargument name="ActivityID" type="numeric" required="yes" />
		
		<cfset var qStat = "">
		
		<cfquery name="qStat" datasource="#Application.Settings.DSN#">
		
		</cfquery>
		
		<cfreturn qStat.StatCount />
	</cffunction>
</cfcomponent>