<cfcomponent displayname="History">
	<cffunction name="init" access="public" output="no" returntype="_com.History">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="Add" access="public" output="no">
		<cfargument name="HistoryStyleID" type="numeric" required="yes" />
		<cfargument name="FromPersonID" type="string" required="yes" />
		<cfargument name="FromActivityID" type="string" required="no" default="" />
		<cfargument name="ToPersonID" type="string" required="no" default="" />
		<cfargument name="ToActivityID" type="string" required="no" default="" />
		<cfargument name="ToCreditID" type="string" required="no" default="" />
		<cfargument name="ToContainerID" type="string" required="no" default="" />
		<cfargument name="ToHistoryID" type="string" required="no" default="" />
		<cfargument name="ToContent" type="string" required="no" default="" />
		<cfargument name="OldActionID" type="string" required="no" default="" />
		<cfargument name="PostDate" type="date" required="no" default="#now()#" />
        
		<cfquery name="qCreate" datasource="#Application.Settings.dsn#" result="CreateResult">
			INSERT INTO ce_History
				(
				HistoryStyleID,
				HistoryHTML,
				FromPersonID,
				FromActivityID,
				ToPersonID,
				ToActivityID,
                ToContainerID,
				ToCreditID,
				ToHistoryID,
				ToContent,
				OldActionID,
				Created
				)
			VALUES
				(
				<cfqueryparam value="#Arguments.HistoryStyleID#" CFSQLType="cf_sql_integer" />,
				NULL,
				<cfqueryparam value="#Arguments.FromPersonID#" CFSQLType="cf_sql_integer" />,
				<cfqueryparam value="#Arguments.FromActivityID#" CFSQLType="cf_sql_integer" null="#not len(Arguments.FromActivityID)#" />,
				<cfqueryparam value="#Arguments.ToPersonID#" CFSQLType="cf_sql_integer" null="#not len(Arguments.ToPersonID)#" />,
				<cfqueryparam value="#Arguments.ToActivityID#" CFSQLType="cf_sql_integer" null="#not len(Arguments.ToActivityID)#" />,
				<cfqueryparam value="#Arguments.ToContainerID#" CFSQLType="cf_sql_integer" null="#not len(Arguments.ToContainerID)#" />,
				<cfqueryparam value="#Arguments.ToCreditID#" CFSQLType="cf_sql_integer" null="#not len(Arguments.ToCreditID)#" />,
				<cfqueryparam value="#Arguments.ToHistoryID#" CFSQLType="cf_sql_integer" null="#not len(Arguments.ToHistoryID)#" />,
				<cfqueryparam value="#Arguments.ToContent#" CFSQLType="cf_sql_varchar" null="#not len(Trim(Arguments.ToContent))#" />,
				<cfqueryparam value="#Arguments.OldActionID#" CFSQLType="cf_sql_integer" null="#not len(Arguments.OldActionID)#" />,
				<cfqueryparam value="#arguments.PostDate#" cfsqltype="cf_sql_timestamp" />
				)
		</cfquery>

		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>
	
	<cffunction name="List" access="public" output="no">
		<cfargument name="FromPersonID" type="numeric" required="no" default="0" />
		<cfargument name="ToPersonID" type="numeric" required="no" default="0" />
		<cfargument name="ToActivityID" type="numeric" required="no" default="0" />
		<cfargument name="NotFromPersonID" type="numeric" required="no" default="0" />
		<cfargument name="HistoryTypeID" type="numeric" required="no" default="0" />
		<cfargument name="HistoryStyleID" type="numeric" required="no" default="0" />
		<cfargument name="StartRows" type="numeric" required="no" default="1" />
		<cfargument name="MaxRows" type="numeric" required="no" default="20" />
		<cfargument name="startFromTime" type="date" required="no" />
		
		<cfquery name="qQuery" datasource="#Application.Settings.DSN#">
			DECLARE @StartRow int
			DECLARE @RecordCount int
			DECLARE @FromPersonID int
			DECLARE @NotFromPersonID int
			DECLARE @HistoryTypeID int
			
			SET @StartRow = <cfqueryparam value="#Arguments.StartRow#" cfsqltype="cf_sql_integer" />;
			SET @RecordCount = <cfqueryparam value="#Arguments.MaxRows#" cfsqltype="cf_sql_integer" />;
			SET @FromPersonID = <cfqueryparam value="#Arguments.FromPersonID#" cfsqltype="cf_sql_integer" />;
			SET @NotFromPersonID = <cfqueryparam value="#Arguments.NotFromPersonID#" cfsqltype="cf_sql_integer" />;
			SET @HistoryTypeID = <cfqueryparam value="#Arguments.HistoryTypeID#" cfsqltype="cf_sql_integer" />;
			
			WITH CTE_MostRecent (HistoryStyleID,FromPersonID,ToActivityID,ToPersonID,LeastRecentID,LeastRecentDate,MostRecentID,MostRecentDate) AS
					(SELECT     
						TOP (@RecordCount)  
						H.HistoryStyleID,
						H.FromPersonID,
						H.ToActivityID,
						H.ToPersonID,
						MIN(H.HistoryID) AS LeastRecentID, 
						MIN(H.Created) AS LeastRecentDate,
						MAX(H.HistoryID) AS MostRecentID, 
						MAX(H.Created) AS MostRecentDate
					FROM ce_History AS H 
					INNER JOIN ce_Sys_HistoryStyle AS HS ON H.HistoryStyleID = HS.HistoryStyleID
					WHERE 
						0=0
						
					<!--- PARAMETERS --->
					<cfif isNumeric(Arguments.FromPersonID) AND Arguments.FromPersonID GT 0 AND isNumeric(Arguments.ToPersonID) AND Arguments.ToPersonID LTE 0>
						AND (H.FromPersonID = @FromPersonID)
					</cfif>
					<cfif isNumeric(Arguments.ToPersonID) AND Arguments.ToPersonID GT 0 AND isNumeric(Arguments.FromPersonID) AND Arguments.FromPersonID LTE 0>
						AND (H.ToPersonID = <cfqueryparam value="#arguments.ToPersonId#" cfsqltype="cf_sql_integer" />)
					</cfif>
					<cfif isNumeric(Arguments.NotFromPersonID) AND Arguments.NotFromPersonID GT 0>
						AND (H.FromPersonID <> @NotFromPersonID)
					</cfif>
					
					<cfif isNumeric(Arguments.ToActivityID) AND Arguments.ToActivityID GT 0>
						AND (H.ToActivityID = <cfqueryparam value="#arguments.ToActivityID#" cfsqltype="cf_sql_integer" />)
					</cfif>
					
					<cfif isNumeric(Arguments.HistoryTypeID) AND Arguments.HistoryTypeID GT 0>
						AND (HS.HistoryTypeID = @HistoryTypeID)
					</cfif>
					<cfif isNumeric(Arguments.HistoryStyleID) AND Arguments.HistoryStyleID GT 0>
						AND (HS.HistoryStyleID = @HistoryStyleID)
					</cfif>
					<cfif structKeyExists(arguments,'startFromTime') AND isDate(arguments.startFromTime)>
						AND (H.Created >= #createodbcdatetime(arguments.startFromTime)#)
					</cfif>
					<cfif structKeyExists(arguments,'ToPersonID') AND isNumeric(arguments.ToPersonID) AND arguments.ToPersonID GT 0 AND
					structKeyExists(arguments,'FromPersonID') AND isNumeric(arguments.FromPersonID) AND arguments.FromPersonID GT 0>
						AND 
						(
						(H.ToPersonID = <cfqueryparam value="#arguments.ToPersonID#" cfsqltype="cf_sql_integer" />)
						OR
						(H.FromPersonID = <cfqueryparam value="#arguments.FromPersonID#" cfsqltype="cf_sql_integer" />)
						)
					</cfif>
					
					GROUP BY 
						H.HistoryStyleID,
						H.ToActivityID,
						H.ToPersonID,
						H.FromPersonID
					ORDER BY MostRecentDate DESC)
						 
				SELECT
					VH.HistoryID, 
					VH.HistoryStyleID, 
					VH.FromPersonID, 
					VH.FromPersonDisplayName, 
					VH.ToPersonID, 
					VH.ToPersonDisplayName, 
					VH.ToPossessive, 
					VH.FromPossessive,
					VH.FromReflexive, 
					VH.ToActivityID, 
					VH.FromActivityID, 
					VH.ToActivityTitle, 
					VH.ToHistoryID, 
					VH.ToCreditID, 
					VH.ToCreditName,
					VH.ToCreditAmount, 
					VH.ToSiteID,
					VH.ToSiteName,
					VH.ToSiteNameShort,
					VH.ToSiteHostName,
					'/admin/index.cfm/event/' As WebPath,
					ToContent = (CASE VH.HistoryTypeID
					WHEN 1 THEN
						ceschema.mergeToContent('A',VH.ToActivityID,VH.HistoryStyleID,LeastRecentID,MostRecentID)
					WHEN 2 THEN
						ceschema.mergeToContent('P',VH.ToPersonID,VH.HistoryStyleID,LeastRecentID,MostRecentID)
					ELSE
						VH.ToContent
					END), 
					
					VH.Created, 
					VH.HiddenFlag, 
					VH.TemplateFrom, 
					VH.TemplateTo, 
					VH.IconImg
				FROM CTE_MostRecent MR
				INNER JOIN View_History VH ON VH.HistoryID=MR.MostRecentID
				ORDER BY MostRecentDate DESC
			</cfquery>
		
		<cfreturn qQuery />
	</cffunction>
	
	<cfinclude template="#Application.Settings.ComPath#/_UDF/HowLongAgo.cfm" />
	
	<cffunction name="RenderHTML" output="no" access="public">
		<cfargument name="QueryRow" type="struct" required="yes" />
		<cfargument name="mode" type="string" required="no" default="email" />
			
		<cfset var ReturnContent = QueryRow.TemplateFrom>
		<cfset var aFoundFields = REMatchNoCase("%[A-Za-z]+%",ReturnContent)>
		<cfset var Output = "">
		
		<cfloop from="1" to="#ArrayLen(aFoundFields)#" index="i">
			<cfset VarName = Trim(ReplaceNoCase(aFoundFields[i],"%","","ALL"))>
			
			<!--- SPECIAL CASES --->
			<cfif VarName EQ "WebPath">
				<cfset ReturnContent = ReplaceNoCase(ReturnContent,VarName,request.myself,"ALL")>
			</cfif>
			<cfif VarName EQ "LMSURL">
				<cfset ReturnContent = ReplaceNoCase(ReturnContent,VarName,Application.Settings.LMSURL,"ALL")>
			</cfif>
			<cfif VarName EQ "CDCURL">
				<cfset ReturnContent = ReplaceNoCase(ReturnContent,VarName,Application.Settings.CDCURL,"ALL")>
			</cfif>
			<cfif isDefined("QueryRow.#VarName#")>
				<cfset ReturnContent = ReplaceNoCase(ReturnContent,VarName,Evaluate("QueryRow.#VarName#"),"ALL")>
			</cfif>
			
			<!---<cfset VarName = Trim(Replace(aFoundFields[i],"%","","ALL"))>--->
		</cfloop>
		<cfoutput>
		<cfsavecontent variable="Output">
			<div class="history-item">
				<div class="history-line">#ReturnContent#</div>
			<cfif Len(QueryRow.ToContent) GT 0>
				<div class="history-subbox">
					#ReplaceNoCase(QueryRow.ToContent,"""/index.cfm/event/","""" & request.myself,"ALL")#
					<div style="clear:both;"></div>
				</div>
			</cfif>
				<div class="history-meta">
				<cfif arguments.mode EQ "email">
				#dateformat(QueryRow.Created,'mmm dd, yyyy')# at #timeformat(queryrow.created,'hh:mm TT')#
				<cfelse>
				#HowLongAgo(QueryRow.Created)#
				</cfif>
				</div>
			</div>
		</cfsavecontent>
		</cfoutput>
		<cfset Output = Replace(Output,"%","","ALL")>
		
		<cfreturn Output />
	</cffunction>
	
	<cffunction name="RenderTEXT" output="no" access="public">
		<cfargument name="QueryRow" type="struct" required="yes" />
		<cfargument name="mode" type="string" required="no" default="email" />
			
		<cfset var ReturnContent = QueryRow.TemplateFrom>
		<cfset var aFoundFields = REMatchNoCase("%[A-Za-z]+%",ReturnContent)>
		<cfset var Output = "">
		
		<cfloop from="1" to="#ArrayLen(aFoundFields)#" index="i">
			<cfset VarName = Trim(ReplaceNoCase(aFoundFields[i],"%","","ALL"))>
			
			<!--- SPECIAL CASES --->
			<cfif VarName EQ "WebPath">
				<cfset ReturnContent = ReplaceNoCase(ReturnContent,VarName,request.myself,"ALL")>
			</cfif>
			<cfif VarName EQ "LMSURL">
				<cfset ReturnContent = ReplaceNoCase(ReturnContent,VarName,Application.Settings.LMSURL,"ALL")>
			</cfif>
			<cfif VarName EQ "CDCURL">
				<cfset ReturnContent = ReplaceNoCase(ReturnContent,VarName,Application.Settings.CDCURL,"ALL")>
			</cfif>
			<cfif isDefined("QueryRow.#VarName#")>
				<cfset ReturnContent = ReplaceNoCase(ReturnContent,VarName,Evaluate("QueryRow.#VarName#"),"ALL")>
			</cfif>
			
			<!---<cfset VarName = Trim(Replace(aFoundFields[i],"%","","ALL"))>--->
		</cfloop>
		<cfoutput>
		<cfsavecontent variable="Output">#application.udf.stripAllBut(application.udf.stripHTML(ReturnContent),'abcdefghijklmnopqrstuvwxyz0123456789 ',false)#<cfif Len(QueryRow.ToContent) GT 0>
		[#application.udf.stripAllBut(application.udf.stripHTML(queryRow.ToContent),'abcdefghijklmnopqrstuvwxyz0123456789 ',false)#]
</cfif>
<cfif arguments.mode EQ "email">#dateformat(QueryRow.Created,'mmm dd, yyyy')# at #timeformat(queryrow.created,'hh:mm TT')#<cfelse>#HowLongAgo(QueryRow.Created)#</cfif>
</cfsavecontent></cfoutput><cfset Output = Replace(Output,"%","","ALL")><cfreturn Output />
	</cffunction>
	
	<cffunction name="RenderMiniFeedHTML" output="no" access="public">
		<cfargument name="Template" type="string" required="yes" />
		<cfargument name="QueryRow" type="struct" required="yes" />
			
		<cfset var ReturnContent = Arguments.Template>
		<cfset var aFoundFields = REMatch("%[A-Za-z]+%",ReturnContent)>
		<cfset var Output = "">

		<cfloop from="1" to="#ArrayLen(aFoundFields)#" index="i">
			<cfset VarName = Trim(Replace(aFoundFields[i],"%","","ALL"))>
			
			<!--- SPECIAL CASES --->
			<cfif isDefined("QueryRow.#VarName#")>
				<cfset ReturnContent = Replace(ReturnContent,VarName,Evaluate("QueryRow.#VarName#"),"ALL")>
			</cfif>
			
			<!---<cfset VarName = Trim(Replace(aFoundFields[i],"%","","ALL"))>--->
		</cfloop>
		<cfoutput>
		<cfsavecontent variable="Output">
			<div class="result-minifeed-item">
				<div class="result-minifeed-line"><img src="/_images/icons/#QueryRow.IconImg#" border="0" />#ReturnContent#</div>
			</div>
		</cfsavecontent>
		</cfoutput>
		<cfset Output = Replace(Output,"%","","ALL")>
		
		<cfreturn Output />
	</cffunction>
	
	
</cfcomponent>