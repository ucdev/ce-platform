<cfparam name="Attributes.AgendaID" default="" />
<cfparam name="Attributes.Description" default="" />
<cfparam name="Attributes.EventDate" />
<cfparam name="Attributes.StartTime" default="" />
<cfparam name="Attributes.EndTime" default="" />
<script>
$(document).ready(function() {
	/* TIME ADJUSTORS START */
	
	$("#StartTime").mask("99:99 aa");
	$("#EndTime").mask("99:99 aa");

});
</script>
<cfoutput>
<form id="frmSaveAgenda" action="" name="frmSaveAgenda" method="post" class="MainForm">
<input type="hidden" name="AgendaID" id="AgendaID" value="#Attributes.AgendaID#" />
<table width="100%" cellspacing="1" cellpadding="2" border="0">
	<tr>
		<td>Description</td>
		<td><input type="text" name="Description"  id="Description" value="#Attributes.Description#" /></td>
	</tr>
	<tr>
		<td>Item Date</td>
		<td>#DateFormat(Attributes.EventDate,'mm/dd/yyyy')#<input type="hidden" name="EventDate" id="EventDate" value="#DateFormat(Attributes.EventDate,'mm/dd/yyyy')#" /></td>
	</tr>
	<tr>
		<td>Start Time</td>
		<td><input type="text" name="StartTime" id="StartTime" style="width:70px;" value="#TimeFormat(Attributes.StartTime,'hh:mm TT')#" /></td>
	</tr>
	<tr>
		<td>End Time</td>
		<td><input type="text" name="EndTime" id="EndTime" style="width:70px;" value="#TimeFormat(Attributes.EndTime,'hh:mm TT')#" /></td>
	</tr>
</table>
</form>
</cfoutput>