<cfcomponent displayname="RenderPod" output="no">
	<cffunction name="init" access="public" output="no" returntype="_com.RenderPod">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="MyRecentActivityList" access="public" output="no" returntype="string">
		
	</cffunction>
	
	<cffunction name="MyRecentPersonList" access="public" output="no" returntype="string">
		
	</cffunction>
	
	<cffunction name="RecentHistory" access="public" output="no" returntype="string" returnformat="plain">
		<cfargument name="FromPerson" type="string" required="no" default="0" />
		<cfargument name="NotFromPerson" type="string" required="no" default="0" />
		<cfargument name="HistoryType" type="string" required="no" default="0" />
		<cfargument name="MaxRows" type="string" required="no" default="10" />
		
		<cfset var qQuery = "">
		<cfset var sOutput = "">
		
		<cfquery name="qQuery" datasource="#Application.Settings.DSN#">
			DECLARE @RecordCount int
			DECLARE @FromPerson int
			DECLARE @NotFromPerson int
			DECLARE @HistoryType int
			
			SET @RecordCount = <cfqueryparam value="#Arguments.MaxRows#" cfsqltype="cf_sql_integer" />;
			SET @FromPerson = <cfqueryparam value="#Arguments.FromPerson#" cfsqltype="cf_sql_integer" />;
			SET @NotFromPerson = <cfqueryparam value="#Arguments.NotFromPerson#" cfsqltype="cf_sql_integer" />;
			SET @HistoryType = <cfqueryparam value="#Arguments.HistoryType#" cfsqltype="cf_sql_integer" />;
			
			WITH CTE_MostRecent (HistoryStyleID,FromPersonID,ToActivityID,ToPersonID,LeastRecentID,LeastRecentDate,MostRecentID,MostRecentDate) AS
			(SELECT     TOP (@RecordCount)  H.HistoryStyleID,H.FromPersonID,H.ToActivityID,H.ToPersonID,MIN(H.HistoryID) AS LeastRecentID, MIN(H.Created) AS LeastRecentDate,MAX(H.HistoryID) AS MostRecentID, MAX(H.Created) AS MostRecentDate
			FROM          ce_History AS H INNER JOIN
			ce_Sys_HistoryStyle AS HS ON H.HistoryStyleID = HS.HistoryStyleID
			WHERE     0=0
			<cfif isNumeric(Arguments.FromPerson) AND Arguments.FromPerson GT 0> AND (H.FromPersonID = @FromPerson)</cfif>
			<cfif isNumeric(Arguments.NotFromPerson) AND Arguments.NotFromPerson GT 0> AND (H.FromPersonID <> @NotFromPerson)</cfif>
			<cfif isNumeric(Arguments.HistoryType) AND Arguments.HistoryType GT 0 > AND (HS.HistoryTypeID = @HistoryType)</cfif>
			 GROUP BY H.HistoryStyleID,H.ToActivityID,H.ToPersonID,H.FromPersonID
 ORDER BY MostRecentDate DESC)
			 
			  SELECT VH.HistoryID, VH.HistoryStyleID, VH.FromPersonID, VH.FromPersonDisplayName, VH.ToPersonID, VH.ToPersonDisplayName, VH.ToPossessive, VH.FromPossessive,
			   VH.FromReflexive, VH.ToActivityID, VH.FromActivityID, VH.ToActivityTitle, VH.ToHistoryID, VH.ToCreditID, ToContent = (CASE VH.HistoryTypeID
				WHEN 1 THEN
					ceschema.mergeToContent('A',VH.ToActivityID,LeastRecentID,MostRecentID)
				WHEN 2 THEN
					ceschema.mergeToContent('P',VH.ToPersonID,LeastRecentID,MostRecentID)
				ELSE
					VH.ToContent
				END), VH.Created, VH.HiddenFlag, 
			  VH.TemplateFrom, VH.TemplateTo, VH.IconImg FROM CTE_MostRecent MR
 INNER JOIN View_History VH ON VH.HistoryID=MR.MostRecentID
 ORDER BY MostRecentDate DESC;
		</cfquery>
		
		<cfsavecontent variable="sOutput">
		<cfloop query="qQuery">
			<cfset FeedHTML = Application.History.RenderHTML(qQuery.TemplateTo,Application.UDF.QueryToStruct(qQuery,qQuery.CurrentRow),true)>
			<cfoutput>#FeedHTML#</cfoutput>
		</cfloop>
		</cfsavecontent>
		
		<cfreturn sOutput />
	</cffunction>
</cfcomponent>