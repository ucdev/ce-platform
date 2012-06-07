<cfparam name="Attributes.ActivityID" default="" />
<cfparam name="Attributes.PubComponentID" default="" />
<cfparam name="Attributes.DisplayName" default="" />
<cfparam name="Attributes.Description" default="" />
<cfparam name="Attributes.FileID" default="0" />

<script>
<cfoutput>
var nFile = #Attributes.FileID#;
</cfoutput>


$(document).ready(function() {
	
	$("#DisplayName").select();
	
	updateFile(nFile);
});
</script>

<cfoutput>
<form name="frmComp" id="frmComp" action="#Application.Settings.RootPath#/_com/ajax_Builder.cfc" method="post">
<input type="hidden" name="PubComponentID" value="#Attributes.PubComponentID#" />
<input type="hidden" name="method" value="SaveComponent" />
<input type="hidden" name="ActivityID" value="#Attributes.ActivityID#" />
<input type="hidden" name="ComponentID" value="14" />
<input type="hidden" name="returnformat" value="plain" />
<table width="100%" cellspacing="1" cellpadding="3">
	<tr>
		<td nowrap="nowrap" class="FieldLabel">Caption</td>
		<td class="FieldInput"><input type="text" name="DisplayName" id="DisplayName" value="#Attributes.DisplayName#" /></td>
	</tr>
	<tr>
		<td nowrap="nowrap" class="FieldLabel" valign="top">Description</td>
		<td class="FieldInput"><textarea name="Description" id="Description" style="width:440px;height:225px;">#Attributes.Description#</textarea></td>
	</tr>
	<tr>
		<td nowrap="nowrap" class="FieldLabel" valign="top">File</td>
		<td class="FieldInput">
			<div id="FileForm"></div>
		</td>
	</tr>
</table>
</form>
</cfoutput>