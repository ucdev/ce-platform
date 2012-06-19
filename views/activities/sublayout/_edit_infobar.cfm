<div class="infoBar_section">
	<div class="title"><h4>Activity Health</h4></div>
	<div class="content">
		<div class="fwb fcg mbs">Status</div> 
		
		<select name="activity-status" class="span4" id="activity-status">
			<option value="1">Active</option>
			<option value="2">Pending</option>
		</select>
	</div>
</div>

<div class="infoBar_section">
	<div class="title"><h4>Statistics</h4></div>
	<div class="content">
		
	</div>
</div>

<div class="infoBar_section">
	<div class="title"><h4>Containers</h4></div>
	<div class="content">
		
	</div>
</div>
<!---<cfoutput>
<div class="infoBar_section">
	<div class="title"><h4>Meta Info</h4></div>
	<div class="content">
	Created By
	
	<a href="#request.myself#Person.Detail?PersonID=#qModified.CreatedByID#">#qModified.CreatedByName#</a> (#DateFormat(ActivityBean.getCreated(),"mm/dd/yyyy")# #TimeFormat(ActivityBean.getCreated(),"hh:mmTT")#)
	
	<cfif Attributes.UpdatedBy NEQ "">
	
	Updated By
	
	<a href="#request.myself#Person.Detail?PersonID=#qModified.UpdatedByID#">#qModified.UpdatedByName#</a> (#DateFormat(ActivityBean.getUpdated(),"mm/dd/yyyy")# #TimeFormat(ActivityBean.getUpdated(),"hh:mmTT")#)
	
	
	</cfif>
	</div>
</div>
</cfoutput>--->

<div class="infoBar_section">
	<div class="title"><h4>Global Options</h4></div>
	<div class="content">
		<div class="btn-group pull-left">
			<a class="btn" title="Delete This Activity"><i class="icon16-trash"></i></a>
			<a class="btn" title="Move This Activity"><i class="icon16-arrow-curve-000-left"></i></a>
			<a class="btn" title="Copy This Activity"><i class="icon16-copy"></i></a>
		</div>
	</div>
</div>