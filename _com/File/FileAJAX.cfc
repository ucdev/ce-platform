<cfcomponent displayname="ActivityFacultyAJAX" output="false">
	<cffunction name="removeChecked" access="remote" output="true" returntype="string">
		<cfargument name="DocList" required="true" type="string">
		<cfargument name="ActivityID" required="false" type="string">
		<cfargument name="PersonID" required="false" type="string">
		
		<cfset Status = "">
		
        <cfif IsDefined("Arguments.ActivityID")>
			<!--- Check to make sure the Argument vars are not blank --->
			<cfif (Arguments.DocList EQ "" OR Arguments.ActivityID EQ "")>
                <cfset Status = "Fail|More information is required to remove the selected files.">
            </cfif>
		
			<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
            <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
            
            <cfif Status EQ "">
                <cftry>
                    <cfset AddCount = 0>
                    
                    <cfloop list="#Arguments.DocList#" index="FileID">
                        <!--- Delete each record --->
                        <cfquery name="qRemoveChecked" datasource="#Application.Settings.DSN#">
                            UPDATE ce_File
                            SET DeletedFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char" />,
                                UpdatedBy = <cfqueryparam value="#Session.Person.getPersonID()#" cfsqltype="cf_sql_char" />
                            WHERE FileID = <cfqueryparam value="#FileID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
                        </cfquery>
                        
                        <!--- Count the total records being deleted --->
                        <cfset AddCount++>
                        
                        <!--- FILE INFO --->
                        <cfset FileBean = CreateObject("component","#Application.Settings.Com#File.File").init(FileID=FileID)>
                        <cfset FileBean = Application.Com.FileDAO.read(FileBean)>
                        
                        <cfset ActionBean = CreateObject("component","#Application.Settings.Com#Action.Action").init()>
                        <cfset ActionBean.setActivityID(Arguments.ActivityID)>
                        <cfset ActionBean.setCode("FIR")>
                        <cfset ActionBean.setShortName("Deleted a file.")>
                        <cfset ActionBean.setLongName("Deleted file '#FileBean.getFileName()#' from activity '<a href=""/index.cfm/event/Activity.Detail?ActivityID=#ActivityBean.getActivityID()#"">#ActivityBean.getTitle()#</a>'")>
                        <cfset ActionBean.setCreatedBy(Session.Person.getPersonID())>
                        <cfset Application.Com.ActionDAO.Create(ActionBean)>
                    </cfloop>
                    
                    <cfif AddCount EQ 1>
                        <cfset Status = "Success|#AddCount# file has been removed.">
                    <cfelse>
                        <cfset Status = "Success|#AddCount# files have been removed.">
                    </cfif>
                    
                    <cfcatch type="any">
                        <cfset Status = "Fail|Error: #cfcatch.message#">
                    </cfcatch>
                </cftry>
            </cfif>
            
        <cfelseif IsDefined("Arguments.PersonID")>
			<!--- Check to make sure the Argument vars are not blank --->
			<cfif (Arguments.DocList EQ "" OR Arguments.PersonID EQ "")>
                <cfset Status = "Fail|More information is required to remove the selected files.">
            </cfif>
		
			<cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").init(PersonID=Arguments.PersonID)>
            <cfset PersonBean = Application.Com.PersonDAO.read(PersonBean)>
            
            <cfif Status EQ "">
                <cftry>
                    <cfset AddCount = 0>
                    
                    <cfloop list="#Arguments.DocList#" index="FileID">
                        <!--- Delete each record --->
                        <cfquery name="qRemoveChecked" datasource="#Application.Settings.DSN#">
                            UPDATE ce_File
                            SET DeletedFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char" />,
                                UpdatedBy = <cfqueryparam value="#Session.Person.getPersonID()#" cfsqltype="cf_sql_char" />
                            WHERE FileID = <cfqueryparam value="#FileID#" CFSQLType="cf_sql_integer" /> AND PersonID = <cfqueryparam value="#Arguments.PersonID#" CFSQLType="cf_sql_integer" />
                        </cfquery>
                        
                        <!--- Count the total records being deleted --->
                        <cfset AddCount++>
                        
                        <!--- FILE INFO --->
                        <cfset FileBean = CreateObject("component","#Application.Settings.Com#File.File").init(FileID=FileID)>
                        <cfset FileBean = Application.Com.FileDAO.read(FileBean)>
                        
                        <cfset ActionBean = CreateObject("component","#Application.Settings.Com#Action.Action").init()>
                        <cfset ActionBean.setPersonID(Arguments.PersonID)>
                        <cfset ActionBean.setCode("FIR")>
                        <cfset ActionBean.setShortName("Deleted a file.")>
                        <cfset ActionBean.setLongName("Deleted file '#FileBean.getFileName()#' from person '<a href=""/index.cfm/event/Person.Detail?PresonID=#PersonBean.getPersonID()#"">#PersonBean.getFirstName()# #PersonBean.getLastName()#</a>'")>
                        <cfset ActionBean.setCreatedBy(Session.Person.getPersonID())>
                        <cfset Application.Com.ActionDAO.Create(ActionBean)>
                    </cfloop>
                    
                    <cfif AddCount EQ 1>
                        <cfset Status = "Success|#AddCount# file has been removed.">
                    <cfelse>
                        <cfset Status = "Success|#AddCount# files have been removed.">
                    </cfif>
                    
                    <cfcatch type="any">
                        <cfset Status = "Fail|Error: #cfcatch.message#">
                    </cfcatch>
                </cftry>
            </cfif>
        </cfif>
		
		<cfreturn Status />
	</cffunction>

	<cffunction name="removeAll" access="remote" output="true" returntype="string">
		<cfargument name="ActivityID" required="false" type="string">
		<cfargument name="PersonID" required="false" type="string">
		
		<cfset Status = "">
		
		<cfif IsDefined("Arguments.ActivityID")>
			<!--- Check to make sure the Argument var is not blank --->
            <cfif Arguments.ActivityID EQ "">
                <cfset Status = "Fail|More information is required to remove all files from this activity.">
            </cfif>
            
            <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
            <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
            
            <cfif Status EQ "">
                <cftry>				
                    <!--- Delete each record --->
                    <cfquery name="qRemoveAll" datasource="#Application.Settings.DSN#">
                        UPDATE ce_File
                        SET DeletedFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char" />,
                            UpdatedBy = <cfqueryparam value="#Session.Person.getPersonID()#" cfsqltype="cf_sql_char" />
                        WHERE ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
                    </cfquery>
                    
                    <cfset ActionBean = CreateObject("component","#Application.Settings.Com#Action.Action").init()>
                    <cfset ActionBean.setActivityID(Arguments.ActivityID)>
                    <cfset ActionBean.setCode("FIR")>
                    <cfset ActionBean.setShortName("Deleted all files.")>
                    <cfset ActionBean.setLongName("Deleted all files from activity '<a href=""/index.cfm/event/Activity.Detail?ActivityID=#ActivityBean.getActivityID()#"">#ActivityBean.getTitle()#</a>'")>
                    <cfset ActionBean.setCreatedBy(Session.Person.getPersonID())>
                    <cfset Application.Com.ActionDAO.Create(ActionBean)>
                    
                    <cfset Status = "Success|All files have been removed.">
                    <cfcatch type="any">
                        <cfset Status = "Fail|Error: #cfcatch.message#">
                    </cfcatch>
                </cftry>
            </cfif>
        <cfelseif IsDefined("Arguments.PersonID")>
        	<!--- Check to make sure the Argument var is not blank --->
            <cfif Arguments.PersonID EQ "">
                <cfset Status = "Fail|More information is required to remove all files from this Person.">
            </cfif>
            
            <cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").init(PersonID=Arguments.PersonID)>
            <cfset PersonBean = Application.Com.PersonDAO.read(PersonBean)>
            
            <cfif Status EQ "">
                <cftry>				
                    <!--- Delete each record --->
                    <cfquery name="qRemoveAll" datasource="#Application.Settings.DSN#">
                        UPDATE ce_File
                        SET DeletedFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char" />,
                            UpdatedBy = <cfqueryparam value="#Session.Person.getPersonID()#" cfsqltype="cf_sql_char" />
                        WHERE PersonID = <cfqueryparam value="#Arguments.PersonID#" CFSQLType="cf_sql_integer" />
                    </cfquery>
                    
                    <cfset ActionBean = CreateObject("component","#Application.Settings.Com#Action.Action").init()>
                    <cfset ActionBean.setPersonID(Arguments.PersonID)>
                    <cfset ActionBean.setCode("FIR")>
                    <cfset ActionBean.setShortName("Deleted all files.")>
                    <cfset ActionBean.setLongName("Deleted all files from Person '<a href=""/index.cfm/event/Person.Detail?PersonID=#PersonBean.getPersonID()#"">#PersonBean.getFirstName()# #PersonBean.getLastName()#</a>'")>
                    <cfset ActionBean.setCreatedBy(Session.Person.getPersonID())>
                    <cfset Application.Com.ActionDAO.Create(ActionBean)>
                    
                    <cfset Status = "Success|All files have been removed.">
                    <cfcatch type="any">
                        <cfset Status = "Fail|Error: #cfcatch.message#">
                    </cfcatch>
                </cftry>
            </cfif>

        </cfif>
		
		<cfreturn Status />
	</cffunction>
</cfcomponent>