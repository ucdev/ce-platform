<cfcomponent displayname="ProcessManagerAjax" output="no">
	<cffunction name="init" access="public" output="false" returntype="_com.ProcessManager.ProcessManagerAjax">
		<cfset variables.dsn = Application.Settings.DSN />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="DeletePeople" access="remote" returntype="string" output="no">
		<cfargument name="PersonList" type="string" required="yes" hint="Comma separated list of PersonID's">
		<cfargument name="ProcessID" type="numeric" required="yes" hint="ProcessID" />
		<cfargument name="DeleteAll" type="string" required="no" default="N" />
		
		<cfset var i = "">
		<cfset var Status = "fail">
		
		<cfif Arguments.DeleteAll EQ "Y">
			<cfquery name="qUpdate" datasource="#Application.Settings.DSN#">
				UPDATE ce_ProcessManager SET Deleted=#CreateODBCDateTIme(now())#,DeletedFlag='Y' WHERE ProcessID=<cfqueryparam value="#Arguments.ProcessID#" cfsqltype="cf_sql_integer" />
			</cfquery>
			
			<cfset Status = "success">
		<cfelse>
			<cfif ListLen(Arguments.PersonList,",") GT 0>
				<cfloop list="#Arguments.PersonList#" index="i" delimiters=",">
					<cfset i = Trim(i)>
					<cfquery name="qUpdate" datasource="#Application.Settings.DSN#">
						UPDATE ce_ProcessManager SET Deleted=#CreateODBCDateTIme(now())#,DeletedFlag='Y' WHERE ProcessID=<cfqueryparam value="#Arguments.ProcessID#" cfsqltype="cf_sql_integer" /> AND PersonID=<cfqueryparam value="#i#" cfsqltype="cf_sql_integer" />
					</cfquery>
				</cfloop>
				<cfset Status = "success">
			</cfif>
		</cfif>
		
		<cfreturn Status />
	</cffunction>
	
	<cffunction name="AddPerson" access="remote" returntype="string" output="no">
		<cfargument name="PersonID" type="string" required="yes" hint="PersonID of person you want to add">
		<cfargument name="ProcessID" type="numeric" required="yes" hint="ProcessID" />
		
		<cfset var i = "">
		<cfset var Status = "fail|Failed for unknown reason.">
		
		<cfquery name="qCheckPerson" datasource="#Application.Settings.DSN#">
			SELECT ProcessManagerID,PersonID,ProcessID,DeletedFlag FROM ce_ProcessManager WHERE PersonID=<cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND ProcessID=<cfqueryparam value="#Arguments.ProcessID#" cfsqltype="cf_sql_integer" />
		</cfquery>
		
		<cfif qCheckPerson.RecordCount GT 0>
			<cfif qCheckPerson.DeletedFlag EQ "Y">
				<cfquery name="qUpdate" datasource="#Application.Settings.DSN#">
					UPDATE ce_ProcessManager SET DeletedFlag='N',Updated=#CreateODBCDateTime(now())#
					WHERE ProcessManagerID=#qCheckPerson.ProcessManagerID#
				</cfquery>
				<cfset Status = "success|Person successfully added to process.">
			<cfelse>
				<cfset Status = "fail|Person already exists in process.">
			</cfif>
		<cfelse>
			<cfquery name="qInsert" datasource="#Application.Settings.DSN#">
				INSERT INTO ce_ProcessManager (PersonID,ProcessID,CreatedBy)
				VALUES (<cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" />,<cfqueryparam value="#Arguments.ProcessID#" cfsqltype="cf_sql_integer" />,#Session.Person.getPersonID()#)
			</cfquery>
			<cfset Status = "success|Person successfully added to process.">
		</cfif>
		
		<cfreturn Status />
	</cffunction>
</cfcomponent>