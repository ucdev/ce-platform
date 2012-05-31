<cfcomponent displayname="Verity Index">
	<cffunction name="IndexActivity" access="remote" output="yes">
		
		<cfset var ExtraContext = "">
		<cfset var qAppended = "">
		<cfsetting requesttimeout="120" />
		<cfquery name="qActivityIndex" datasource="#Application.Settings.DSN#">
			SELECT ActivityID AS ObjectID,'Activity' As ObjectType,Title,ReleaseDate,ActivityTypeID,GroupingID,'ActivityID=' + CAST(ActivityID AS nvarchar) As IndexKey,'/index.cfm/event/Activity.Detail?ActivityID=' + CAST(ActivityID AS nvarchar) As URLPath
			FROM ce_Activity
			WHERE DeletedFlag='N'
		</cfquery>
		
		<cfset qAppended = QueryNew("ObjectID,ObjectType,Title,ReleaseDate,ActivityTypeID,GroupingID,IndexKey,URLPath,BodyAppend")>
		
		<cfloop query="qActivityIndex">
			<cfset newRow = QueryAddRow(qAppended)>
			<cfset QuerySetCell(qAppended,"ObjectID",qActivityIndex.ObjectID)>
			<cfset QuerySetCell(qAppended,"ObjectType",qActivityIndex.ObjectType)>
			<cfset QuerySetCell(qAppended,"Title",qActivityIndex.Title)>
			<cfset QuerySetCell(qAppended,"ReleaseDate",DateFormat(qActivityIndex.ReleaseDate,'mm/dd/yyyy'))>
			<cfset QuerySetCell(qAppended,"ActivityTypeID",qActivityIndex.ActivityTypeID)>
			<cfset QuerySetCell(qAppended,"GroupingID",qActivityIndex.GroupingID)>
			<cfset QuerySetCell(qAppended,"IndexKey",qActivityIndex.IndexKey)>
			<cfset QuerySetCell(qAppended,"URLPath",qActivityIndex.URLPath)>
			<cfset QuerySetCell(qAppended,"BodyAppend","Title: #qActivityIndex.Title# Release Date: #DateFormat(qActivityIndex.ReleaseDate,'mm/dd/yyyy')# ")>
		</cfloop>
		
		<cfquery name="qIndex" dbtype="query">
			SELECT * FROM qAppended
		</cfquery>
		
		<cfloop query="qIndex">
			<cfset qFaculty = Application.Com.ActivityFacultyGateway.getByViewAttributes(ActivityID=qIndex.ObjectID,DeletedFlag='N')>
			<cfif qFaculty.RecordCount GT 0>
				<cfsavecontent variable="ExtraContext"><cfoutput>Faculty: <cfloop query="qFaculty">#qFaculty.FirstName# #qFaculty.Lastname# (#qFaculty.PersonID#) </cfloop></cfoutput></cfsavecontent>
				<cfset QuerySetCell(qAppended,"BodyAppend",qIndex.BodyAppend & ExtraContext,qIndex.currentrow)>
			</cfif>
		</cfloop>
		
		<cfloop query="qIndex">
			<cfset qCommittee = Application.Com.ActivityCommitteeGateway.getByViewAttributes(ActivityID=qIndex.ObjectID,DeletedFlag='N')>
			<cfif qCommittee.RecordCount GT 0>
				<cfsavecontent variable="ExtraContext"><cfoutput>Committee: <cfloop query="qCommittee">#qCommittee.FirstName# #qCommittee.Lastname# (#qCommittee.PersonID#) </cfloop></cfoutput></cfsavecontent>
				<cfset QuerySetCell(qAppended,"BodyAppend",qIndex.BodyAppend & ExtraContext,qIndex.currentrow)>
			</cfif>
		</cfloop>
		
		<cfloop query="qIndex">
			<cfset qCats = Application.Com.ActivityCategoryGateway.getByViewAttributes(ActivityID=qIndex.ObjectID,DeletedFlag='N')>
			<cfif qCats.RecordCount GT 0>
				<cfsavecontent variable="ExtraContext"><cfoutput>Containers: <cfloop query="qCats">#qCats.Name# </cfloop></cfoutput></cfsavecontent>
				<cfset QuerySetCell(qAppended,"BodyAppend",qIndex.BodyAppend & ExtraContext,qIndex.currentrow)>
			</cfif>
		</cfloop>
		
		<!---<cfloop query="qIndex">
			<cfset qNewAttendees = QueryNew("FirstName,LastName,UCID,PersonID")>
			<cfquery name="qAttendees" datasource="#Application.Settings.DSN#">
				SELECT     p1.firstname, p1.lastname, p1.UCID, ac.PersonID
				FROM         ce_Attendee AS ac LEFT OUTER JOIN
				  dbo.ce_person AS p1 ON p1.personid = ac.PersonID
				WHERE ac.ActivityID=#qIndex.ObjectID# AND ac.DeletedFlag='N'
			</cfquery>
			
			<cfset qNewAttendees = qAttendees>
			
			<cfquery name="qLoopAttendees" dbtype="query" timeout="#CreateTimeSpan(0,0,0,60)#">
				SELECT * FROM qNewAttendees
			</cfquery>
			
			<cfsavecontent variable="ExtraContext"><cfoutput><strong>Registrants:</strong> <cfloop query="qLoopAttendees">#qLoopAttendees.FirstName# #qLoopAttendees.Lastname# (#qLoopAttendees.PersonID#) </cfloop><br /></cfoutput></cfsavecontent>
			<cfset QuerySetCell(qAppended,"BodyAppend",qIndex.BodyAppend & ExtraContext,qIndex.currentrow)>
		</cfloop>--->
		
		<cfindex 
			action="update" 
			type="custom" 
			collection="CCPDAdmin" 
			query="qAppended" 
			key="IndexKey" 
			title="Title" 
			body="BodyAppend"
			custom1="ReleaseDate"
			custom2="ActivityTypeID"
			custom3="GroupingID"
			urlPath="URLPath">

	</cffunction>
	
	<cffunction name="IndexFiles" access="remote" output="yes">
		<cfquery name="qFileIndex" datasource="#Application.Settings.DSN#">
			SELECT FileID AS ObjectID,'Activity File' As ObjectType,FileName + ' ' + FileCaption As FileTitle,'C:\Sites\ccpdadmin-prod\_uploads\ActivityFiles\' + CAST(ActivityID AS nvarchar) + '\' + FileName As IndexKey,'/index.cfm/event/File.Download?Mode=Activity&ModeID=' + CAST(ActivityID AS nvarchar) + '&ID=' + CAST(FileID AS nvarchar) As URLPath
			FROM ce_File
			WHERE ActivityID IS NOT NULL AND DeletedFlag='N'
			
			UNION
			
			SELECT FileID AS ObjectID,'Person File' As ObjectType,FileName + ' ' + FileCaption As FileTitle,'C:\Sites\ccpdadmin-prod\_uploads\PersonFiles\' + CAST(PersonID AS nvarchar) + '\' + FileName As IndexKey,'/index.cfm/event/File.Download?Mode=Person&ModeID=' + CAST(PersonID AS nvarchar) + '&ID=' + CAST(FileID AS nvarchar) As URLPath
			FROM ce_File
			WHERE PersonID IS NOT NULL AND DeletedFlag='N'
		</cfquery>
		
		<cfindex 
			action="update" 
			type="file" 
			collection="CCPDAdmin" 
			query="qFileIndex" 
			key="IndexKey" 
			title="FileTitle" 
			body="ObjectID,ObjectType,IndexKey,URLPath" 
			urlPath="URLPath">
	</cffunction>
	
	<cffunction name="Search" access="remote" output="yes">
		<cfargument name="q" type="string" required="yes" />
		
		<cfsearch
			name = "mySearch"
			collection = "CCPDAdmin"
			criteria = "#arguments.q#"
			contextpassages = "1"
			suggestions="25"
			maxrows = "100"
			status="ResultStatus"
			type="internet_basic">
		
		<cfset SearchPager = CreateObject("component","#Application.Settings.Com#Pagination").init()>
		<cfset SearchPager.setQueryToPaginate(mySearch)>
		<cfset SearchPager.setBaseLink("#Application.Settings.ComPath#/VerityIndex.cfc?method=Search&q=#Arguments.q#") />
		<cfset SearchPager.setItemsPerPage(25) />
		<cfset SearchPager.setUrlPageIndicator("page") />
		<cfset SearchPager.setShowNumericLinks(true) />
		<cfset SearchPager.setClassName("green") />
		
			<script>
			$(document).ready(function() {
				$(".next,.page,.prev").click(function() {
					updateResults($(this).attr('href'));
					return false;
				});
				
				$("##DidYouMean").click(function() {
					$("##SearchQuery").val($(this).text());
					$("##SearchQuery").focus();
					updateResults($(this).attr('href'));
					return false;
				});	
			});
			</script>
			<cfif mySearch.RecordCount GT 0>
			<cfif isDefined("ResultStatus.SuggestedQuery")>Did you mean <a href="#Application.Settings.ComPath#/VerityIndex.cfc?method=Search&q=#ResultStatus.suggestedQuery#" id="DidYouMean">#ResultStatus.suggestedQuery#</a>?</cfif>
			
			<cfif SearchPager.getTotalNumberOfPages() GT 1><div><cfoutput>#SearchPager.getRenderedHTML()#</cfoutput></div></cfif>
			<cfoutput query="mySearch" startrow="#SearchPager.getStartRow()#" maxrows="#SearchPager.getMaxRows()#">
				<div class="ResultItem">
					<div class="ResultTitle">
						<a href="#mySearch.URL#">#mySearch.Title#<cfif mysearch.custom1 NEQ ""> // #DateFormat(mySearch.custom1,'mm/dd/yyyy')#</cfif></a> <span class="ResultType"><cfif mySearch.key CONTAINS "C:\">
						Document
					<cfelseif mySearch.key CONTAINS "ActivityID">
						Activity
					</cfif></span><cfif mySearch.Author NEQ ""><span class="ResultAuthor"> by #mySearch.Author#</span></cfif></div>
					<div class="ResultContext">#mySearch.Context#</div>
				</div>
			</cfoutput>
			<cfif SearchPager.getTotalNumberOfPages() GT 1><div><cfoutput>#SearchPager.getRenderedHTML()#</cfoutput></div></cfif>
			<cfelse>
				<div class="ResultItem">No results found.</div>
			</cfif>
	</cffunction>
</cfcomponent>