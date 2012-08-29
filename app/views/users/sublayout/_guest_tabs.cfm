<cfoutput>
<!--- LEGACY CODE, NEEDS CLEANED AND PORTED WITH WHEELS --->
<cfquery name="qSpecialties" datasource="#get("dataSourceName")#">
SELECT     
	SpecialtyID, 
	Name, 
	Description,
	
	/* ACTIVITY COUNT */
	(SELECT     COUNT(ActS.Activity_LMS_SpecialtyID) AS ActivityCount
	FROM          ce_Activity_SpecialtyLMS AS ActS INNER JOIN
					   ce_Activity AS A ON ActS.ActivityID = A.ActivityID INNER JOIN
					   ce_Activity_PubGeneral AS APG ON A.ActivityID = APG.ActivityID
	WHERE      (ActS.SpecialtyID = S.SpecialtyID) AND (ActS.DeletedFlag = 'N') AND (A.DeletedFlag = 'N') AND (APG.PublishDate <= GETDATE()) AND (APG.RemoveDate > GETDATE())
						AND (A.StatusID = 1) OR
					   (ActS.SpecialtyID = S.SpecialtyID) AND (ActS.DeletedFlag = 'N') AND (A.DeletedFlag = 'N') AND (APG.PublishDate <= GETDATE()) AND 
					   (APG.RemoveDate IS NULL) AND (A.StatusID = 1)) AS ActivityCount
FROM         ce_Sys_SpecialtyLMS AS S
WHERE     
	((SELECT     COUNT(ActS.Activity_LMS_SpecialtyID) AS ActivityCount
	FROM         ce_Activity_SpecialtyLMS AS ActS INNER JOIN
	   ce_Activity AS A ON ActS.ActivityID = A.ActivityID INNER JOIN
	   ce_Activity_PubGeneral AS APG ON A.ActivityID = APG.ActivityID
	WHERE     (ActS.SpecialtyID = S.SpecialtyID) AND (ActS.DeletedFlag = 'N') AND (A.DeletedFlag = 'N') AND (APG.PublishDate <= GETDATE()) AND (APG.RemoveDate > GETDATE()) 
	   AND (A.StatusID = 1) OR
	   (ActS.SpecialtyID = S.SpecialtyID) AND (ActS.DeletedFlag = 'N') AND (A.DeletedFlag = 'N') AND (APG.PublishDate <= GETDATE()) AND 
	   (APG.RemoveDate IS NULL) AND (A.StatusID = 1)) > 0)
ORDER BY Name
</cfquery>

<cfquery name="qCategories" datasource="#get("dataSourceName")#">
	SELECT     
		CategoryID, 
		Name, 
		Description,
		/* ACTIVITY COUNT */
		(SELECT
			COUNT(ActS.Activity_LMS_CategoryID) AS ActivityCount
		FROM          
			ce_Activity_CategoryLMS AS ActS 
		INNER JOIN
			ce_Activity AS A ON ActS.ActivityID = A.ActivityID 
		INNER JOIN
			ce_Activity_PubGeneral AS APG ON A.ActivityID = APG.ActivityID
		WHERE      (ActS.CategoryID = S.CategoryID) AND (ActS.DeletedFlag = 'N') AND (A.DeletedFlag = 'N') AND (APG.PublishDate <= GETDATE()) AND (APG.RemoveDate > GETDATE())
		AND (A.StatusID = 1) OR
		(ActS.CategoryID = S.CategoryID) AND (ActS.DeletedFlag = 'N') AND (A.DeletedFlag = 'N') AND (APG.PublishDate <= GETDATE()) AND 
		(APG.RemoveDate IS NULL) AND (A.StatusID = 1)) AS ActivityCount
		FROM         ce_Sys_CategoryLMS AS S
		WHERE     
		((SELECT     COUNT(ActS.Activity_LMS_CategoryID) AS ActivityCount
		FROM         ce_Activity_CategoryLMS AS ActS INNER JOIN
		ce_Activity AS A ON ActS.ActivityID = A.ActivityID INNER JOIN
		ce_Activity_PubGeneral AS APG ON A.ActivityID = APG.ActivityID
		WHERE     (ActS.CategoryID = S.CategoryID) AND (ActS.DeletedFlag = 'N') AND (A.DeletedFlag = 'N') AND (APG.PublishDate <= GETDATE()) AND (APG.RemoveDate > GETDATE()) 
		AND (A.StatusID = 1) OR
		(ActS.CategoryID = S.CategoryID) AND (ActS.DeletedFlag = 'N') AND (A.DeletedFlag = 'N') AND (APG.PublishDate <= GETDATE()) AND 
		(APG.RemoveDate IS NULL) AND (A.StatusID = 1)) > 0)
		ORDER BY Name
</cfquery>

<!---<cfquery name="qTags" cachedwithin="#createTimeSpan(0,1,0,0)#" datasource="#get("dataSourceName")#">
SELECT     
	id, 
	Name,
	
	/* ACTIVITY COUNT */
	(SELECT     COUNT(ActS.activityid) AS ActivityCount
	FROM          ceschema.ce_activity_tag_relates AS ActS INNER JOIN
					   ceschema.ce_Activity AS A ON ActS.ActivityID = A.ActivityID INNER JOIN
					   ceschema.ce_Activity_PubGeneral AS APG ON A.ActivityID = APG.ActivityID
	WHERE      (ActS.tagid = S.id) AND S.hideflag=0 AND S.tagcount > 20 AND (A.DeletedFlag = 'N') AND (APG.PublishDate <= GETDATE()) AND (APG.RemoveDate > GETDATE())
						AND (A.StatusID = 1) OR
					   (ActS.tagid = S.id) AND S.hideflag=0 AND S.tagcount > 20 AND (A.DeletedFlag = 'N') AND (APG.PublishDate <= GETDATE()) AND 
					   (APG.RemoveDate IS NULL) AND (A.StatusID = 1)) AS ActivityCount
FROM         ceschema.ce_activity_tags AS S
WHERE     
	((SELECT     COUNT(ActS.activityid) AS ActivityCount
	FROM         ceschema.ce_activity_tag_relates AS ActS INNER JOIN
	   ceschema.ce_Activity AS A ON ActS.ActivityID = A.ActivityID INNER JOIN
	   ceschema.ce_Activity_PubGeneral AS APG ON A.ActivityID = APG.ActivityID
	WHERE     (ActS.tagid = S.id) AND S.hideflag=0 AND S.tagcount > 20 AND (A.DeletedFlag = 'N') AND (APG.PublishDate <= GETDATE()) AND (APG.RemoveDate > GETDATE()) 
	   AND (A.StatusID = 1) OR
	   (ActS.tagid = S.id) AND S.hideflag=0 AND S.tagcount > 20  AND (A.DeletedFlag = 'N') AND (APG.PublishDate <= GETDATE()) AND 
	   (APG.RemoveDate IS NULL) AND (A.StatusID = 1)) > 0)
ORDER BY Name
</cfquery>--->
<p>
<ul class="nav nav-list">
	<cfif qCategories.recordCount GT 0>
	<li class="nav-header">Categories</li>
	<li><a href="/activities/?submitted=1" title="All Activities" style="text-decoration:none; font-weight:bold;">All Activities (#model("activity").count()#)</a></li>
	<cfloop query="qCategories">
	<li><a href="/activities/?category=#qCategories.CategoryId#&submitted=1" title="#qCategories.Name#" style="text-decoration:none;">#midLimit(qCategories.Name,30)# (#qCategories.ActivityCount#)</a></li>
	</cfloop>
	</cfif>
	<cfif qSpecialties.recordCount GT 0>
	<li class="nav-header">Specialties</li>
	<li><a href="/activities/?submitted=1" title="All Activities" style="text-decoration:none; font-weight:bold;">All Activities (#model("activity").count()#)</a></li>
	<cfloop query="qSpecialties">
	<li><a href="/activities/?specialty=#qSpecialties.SpecialtyID#&submitted=1" title="#qSpecialties.Name#" style="text-decoration:none;">#midLimit(qSpecialties.Name,30)# (#qSpecialties.ActivityCount#)</a></li>
	</cfloop>
	</cfif>
</ul>
</p>
</cfoutput>