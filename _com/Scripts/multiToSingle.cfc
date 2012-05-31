<cfcomponent displayname="Non-RSS Multisession to Single Session" output="no">
	<cffunction name="Run" output="yes" access="remote" returntype="string" returnformat="plain">
		
		<!--- NON-RSS MULTI-SESSION PARENTS --->
		<cfquery name="qParents" datasource="#Application.Settings.DSN#">
			SELECT * FROM ce_Activity
			WHERE GroupingID <> 2 AND ParentActivityID IS NULL AND DeletedFlag='N' AND SessionType='M'
			ORDER BY StartDate
		</cfquery>
		
		<cfloop query="qParents">
			=================================================<br>
			START PARENT: #UCase(qParents.Title)#<br>
			=================================================<br><cfflush>
			<cfquery name="qChildren" datasource="#Application.Settings.DSN#">
				SELECT * FROM ce_Activity
				WHERE ParentActivityID = #qParents.ActivityID# AND DeletedFlag='N'
			</cfquery>
			
			<cfif qChildren.RecordCount GT 0>
				<cfloop query="qChildren">
					<cfquery name="qUpdate" datasource="#Application.Settings.DSN#">
						UPDATE ce_Activity
						SET ParentActivityID=NULL,
							SessionType='S',
							ActivityTypeID=#qParents.ActivityTypeID#,
							GroupingID=#qParents.GroupingID#,
							Updated=#CreateODBCDateTime(now())#,
							UpdatedBy=169841
						WHERE
							ActivityID=#qChildren.ActivityID#
					</cfquery>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UPDATED: #UCase(qChildren.Title)#<br><cfflush>
				</cfloop>
				
				<!--- LOGICALLY DELETE PARENT --->
				<cfquery name="qUpdate" datasource="#Application.Settings.DSN#">
					UPDATE ce_Activity
					SET
						Updated=#CreateODBCDateTime(now())#,
						UpdatedBy=169841,
						Deleted=#CreateODBCDateTime(now())#,
						DeletedFlag='Y'
					WHERE
						ActivityID=#qParents.ActivityID#
				</cfquery>
				=================================================<br>
				END PARENT: #UCase(qParents.Title)# (logically deleted)<br><cfflush>
			<cfelse>
				=================================================<br>
				END PARENT: #UCase(qParents.Title)# (no children found)<br><cfflush>
			</cfif>
		</cfloop>
	</cffunction>
</cfcomponent>