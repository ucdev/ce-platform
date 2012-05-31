<cfcomponent displayname="Listing" output="no">
	<cffunction name="Get" access="public" returntype="query" output="no">
		<cfargument name="PageSize" required="no" type="numeric" default="25">
		<cfargument name="PageIndex" required="no" type="numeric" default="1">
		<cfargument name="TableName" required="yes" type="string">
		<cfargument name="Columns" required="yes" type="string">
		<cfargument name="QueryFilter" required="yes" type="string">
		<cfargument name="SortField" required="yes" type="string">
		<cfargument name="PrimaryKey" required="yes" type="string">
		<cfquery name="qListing" datasource="#Application.Settings.DSN#">
			SELECT     RowNum, #Arguments.Columns#
			FROM         (SELECT     #Arguments.Columns#, ROW_NUMBER() OVER (ORDER BY #Arguments.SortField#) 
					  AS RowNum
			FROM         #Arguments.TableName# L
			WHERE     0=0 #PreserveSingleQuotes(Arguments.QueryFilter)#) AS Listing
			WHERE     RowNum BETWEEN #Arguments.PageIndex# AND #Arguments.PageIndex+Arguments.PageSize#-1
		</cfquery>
		
		<cfreturn qListing>
	</cffunction>
	
	<cffunction name="getPeople" access="remote" returntype="any" output="no">
		<cfargument name="LastName" type="string" required="no" default="">
		<cfargument name="FirstName" type="string" required="no" default="">
		<cfargument name="UCID" type="string" required="no" default="">
		<cfargument name="SSN" type="string" required="no" default="">
		<cfargument name="DOB" type="string" required="no" default="">
		<cfargument name="PageIndex" type="string" required="no" default="1">
		<cfargument name="PageSize" type="string" required="no" default="25">
		<cfset sWhere = "">
		<cfif Arguments.LastName NEQ "">
			<cfset sWhere = sWhere & " AND LastName LIKE '%#Arguments.LastName#%'">
		</cfif>
		
		<cfif Arguments.FirstName NEQ "">
			<cfset sWhere = sWhere & " AND FirstName LIKE '%#Arguments.FirstName#%'">
		</cfif>
		
		<cfif Arguments.UCID NEQ "">
			<cfset sWhere = sWhere & " AND UCID = '#Trim(Arguments.UCID)#'">
		</cfif>
		
		<cfif Arguments.SSN NEQ "">
			<cfset sWhere = sWhere & " AND SSN = '#Trim(Arguments.SSN)#'">
		</cfif>
		
		<cfif Arguments.DOB NEQ "">
			<cfset sWhere = sWhere & " AND Birthdate BETWEEN '#DateFormat(Arguments.DOB,'mm/dd/yyyy')# 00:00:00' AND '#DateFormat(Arguments.DOB,'mm/dd/yyyy')# 23:59:59'">
		</cfif>
		
		<cfif sWhere NEQ "">
			<cfinvoke component="Listing" method="Get" 
				PageSize="#Arguments.PageSize#" 
				PageIndex="#Arguments.PageIndex#"
				TableName="ce_Person"
				Columns="PersonID,FirstName,LastName,Email1,Birthdate"
				QueryFilter="#sWhere#" SortField="LastName,FirstName" PrimaryKey="PersonID" returnvariable="qPeople">
		</cfif>
		
		<cfif url.returnFormat EQ "plain">
			<cfsavecontent variable="JSONoutput">
				<cfoutput>
				{
					<cfloop query="qPeople">
					"#qPeople.PersonID#": "#qPeople.LastName#, #qPeople.FirstName#"<cfif qPeople.RecordCount NEQ qPeople.CurrentRow>,</cfif>
					</cfloop>
				}
				</cfoutput>
			</cfsavecontent>
			
			<cfreturn JSONoutput />
		<cfelseif isDefined("qPeople")>
			<cfreturn qPeople />
		</cfif>
	</cffunction>
	
	<cffunction name="getResources" access="remote" returntype="query" output="no">
		<cfargument name="Name" type="string" required="no" default="">
		<cfargument name="Description" type="string" required="no" default="">
		<cfargument name="ResourceTypeID" type="string" required="no" default="">
		<cfargument name="PageIndex" type="string" required="no" default="1">
		<cfargument name="PageSize" type="string" required="no" default="25">
		
		<cfset sWhere = " AND DeletedFlag='N' AND ChurchID=#Session.Church.getChurchID()#">
		
		<cfif Arguments.Name NEQ "">
			<cfset sWhere = sWhere & " AND Name LIKE '%#Arguments.Name#%'">
		</cfif>
		
		<cfif Arguments.Description NEQ "">
			<cfset sWhere = sWhere & " AND Description LIKE '%#Arguments.Description#%'">
		</cfif>
		
		<cfif Arguments.ResourceTypeID NEQ "" AND Arguments.ResourceTypeID GT 0>
			<cfset sWhere = sWhere & " AND ResourceTypeID = #arguments.ResourceTypeID#">
		</cfif>
		
		<cfinvoke component="Listing" method="Get" 
			PageSize="#Arguments.PageSize#" 
			PageIndex="#Arguments.PageIndex#"
			TableName="View_Resources"
			Columns="ResourceID,Name,ResourceTypeID,ResourceTypeName,ContactPersonID,ContactPerson,Created,CreatedBy,CreatedByName,Updated,UpdatedBy,UpdatedByName"
			QueryFilter="#sWhere#" SortField="Name,Description" PrimaryKey="ResourceID" returnvariable="qResources">
		
		<cfreturn qResources />
		
	</cffunction>
	
	<cffunction name="getBatches" access="remote" returntype="query" output="no">
		<cfargument name="Name" type="string" required="no" default="">
		<cfargument name="PostDate" type="string" required="no" default="">
		<cfargument name="Status" type="string" required="no" default="">
		<cfargument name="TransferredFlag" type="string" required="no" default="">
		<cfargument name="PageIndex" type="string" required="no" default="1">
		<cfargument name="PageSize" type="string" required="no" default="25">
		
		<cfset sWhere = " AND ChurchID=#Session.Church.getChurchID()#">
		
		<cfif Arguments.Name NEQ "">
			<cfset sWhere = sWhere & " AND Name LIKE '%#Arguments.Name#%'">
		</cfif>
		
		<cfif Arguments.PostDate NEQ "" AND isDate(Arguments.PostDate)>
			<cfset sWhere = sWhere & " AND PostDate BETWEEN '#Arguments.PostDate# 0:00:00' AND '#Arguments.PostDate# 23:59:59'">
		</cfif>
		
		<cfif Arguments.Status EQ "O" OR Arguments.Status EQ "C">
			<cfset sWhere = sWhere & " AND Status = '#arguments.Status#'">
		</cfif>
		
		<cfif Arguments.TransferredFlag EQ "Y" OR Arguments.TransferredFlag EQ "N">
			<cfset sWhere = sWhere & " AND TransferredFlag = '#arguments.TransferredFlag#'">
		</cfif>
		
		<cfinvoke component="Listing" method="Get" 
			PageSize="#Arguments.PageSize#" 
			PageIndex="#Arguments.PageIndex#"
			TableName="ch_FinBatch"
			Columns="BatchID,Name,PostDate,Status,TransferredFlag"
			QueryFilter="#sWhere#" SortField="BatchID DESC" PrimaryKey="BatchID" returnvariable="qBatches">
		
		<cfreturn qBatches />
		
	</cffunction>
	
	<cffunction name="checkExists" output="no" access="remote" returntype="string">
		<cfargument name="CheckType" type="numeric" default="0">
		<cfargument name="CheckValue" type="string" default="" required="yes">
		
		<cfset var PrimaryKey = "RaceEthnicityID,RecAsBaptID,RecAsMemID,ChurchRelationID,SkillID,TermReasonID,VisitReasonID,TransactionTypeID">
		<cfset var TablesAvail = "ChurchRaceEthnicity,ChurchRecAsBapt,ChurchRecAsMem,ChurchRelation,ChurchSkill,ChurchTermReason,ChurchVisitReason,System_TxType">
		
		<cfset var FieldName = GetToken(PrimaryKey,CheckType,",")>
		<cfset var TableName = GetToken(TablesAvail,CheckType,",")>
		
		<cfquery name="qCheck" datasource="#Application.Settings.DSN#">
			SELECT #FieldName# As CheckValueID FROM ch_#TableName# WHERE Name = <cfqueryparam value="#Arguments.CheckValue#" cfsqltype="cf_sql_varchar" /> AND ChurchID=<cfqueryparam value="#Session.Church.getChurchID()#" cfsqltype="cf_sql_integer" /> AND DeletedFlag='N'
		</cfquery>
		
		<cfif qCheck.RecordCount GT 0>
			<cfset ReturnValue = qCheck.CheckValueID>
		<cfelse>
			<cfset ReturnValue = "false">
		</cfif>
		
		<cfreturn ReturnValue />
	</cffunction>
	
	<cffunction name="addItem" output="no" access="remote" returntype="string">
		<cfargument name="CheckType" type="numeric" default="0">
		<cfargument name="CheckValue" type="string" default="" required="yes">
		
		<cfset var PrimaryKey = "RaceEthnicityID,RecAsBaptID,RecAsMemID,ChurchRelationID,SkillID,TermReasonID,VisitReasonID,TransactionTypeID">
		<cfset var TablesAvail = "ChurchRaceEthnicity,ChurchRecAsBapt,ChurchRecAsMem,ChurchRelation,ChurchSkill,ChurchTermReason,ChurchVisitReason,System_TxType">
		
		<cfset var FieldName = GetToken(PrimaryKey,CheckType,",")>
		<cfset var TableName = GetToken(TablesAvail,CheckType,",")>
		<cfset var NewID = 0>
		
		<cfquery name="qCheck" datasource="#Application.Settings.DSN#">
			SELECT #FieldName# As CheckValueID FROM ch_#TableName# WHERE Name = <cfqueryparam value="#Arguments.CheckValue#" cfsqltype="cf_sql_varchar" /> AND ChurchID=<cfqueryparam value="#Session.Church.getChurchID()#" cfsqltype="cf_sql_integer" />
		</cfquery>
		
		<cfif qCheck.RecordCount GT 0>
			<cfquery name="qUpdate" datasource="#Application.Settings.DSN#">
			UPDATE ch_#TableName# SET Name=<cfqueryparam value="#Arguments.CheckValue#" cfsqltype="cf_sql_varchar" />,DeletedFlag='N',Updated=#CreateODBCDateTime(now())#
			WHERE #FieldName#=#qCheck.CheckValueID#
			</cfquery>
			<cfset NewID = qCheck.CheckValueID>
		<cfelse>
			<cfquery name="qAdd" datasource="#Application.Settings.DSN#">
				INSERT INTO ch_#TableName# (ChurchID,Name) VALUES (#Session.Church.getChurchID()#,<cfqueryparam value="#Arguments.CheckValue#" cfsqltype="cf_sql_varchar" />); SELECT @@IDENTITY As NewItemID;
			</cfquery>
			<cfset NewID = qAdd.NewItemID>
		</cfif>
		
		<cfreturn NewID />
	</cffunction>
	
	<cffunction name="getPersonNameByID" output="no" access="remote" returntype="string">
		<cfargument name="PersonID" type="numeric" default="0">
		
		<cfquery name="qGetName" datasource="#Application.Settings.DSN#">
			SELECT (LastName + ', ' + FirstName) AS Name,DeletedFlag FROM ch_Person WHERE PersonID=<cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" />
		</cfquery>
		
		<cfif qGetName.DeletedFlag EQ "Y">
			<cfset ReturnValue = "Deleted">
		<cfelse>
			<cfset ReturnValue = qGetName.Name>
		</cfif>
		
		<cfreturn ReturnValue />
	</cffunction>
</cfcomponent>