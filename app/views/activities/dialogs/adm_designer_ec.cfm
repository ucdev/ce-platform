<cfparam name="Attributes.ActivityID" default="" />
<cfparam name="Attributes.PubComponentID" default="" />
<cfparam name="Attributes.DisplayName" default="" />
<cfparam name="Attributes.Description" default="" />
<cfparam name="Attributes.ExternalURL" default="" />

<script>


$(document).ready(function() {
	
	$("#DisplayName").select();
});
</script>

<cfoutput>
<form name="frmComp" id="frmComp" action="#Application.Settings.RootPath#/_com/ajax_Builder.cfc" method="post">
<input type="hidden" name="PubComponentID" value="#Attributes.PubComponentID#" />
<input type="hidden" name="method" value="SaveComponent" />
<input type="hidden" name="ActivityID" value="#Attributes.ActivityID#" />
<input type="hidden" name="ComponentID" value="10" />
<input type="hidden" name="returnformat" value="plain" />
<table width="100%" cellspacing="1" cellpadding="3">
	<tr>
		<td class="FieldLabel">Heading</td>
		<td class="FieldInput"><input type="text" name="DisplayName" id="DisplayName" value="#Attributes.DisplayName#" style="width:470px;" /></td>
	</tr>
	<tr>
		<td width="120" nowrap="nowrap" class="FieldLabel" valign="top">Description</td>
		<td class="FieldInput"><textarea name="Description" id="Description" style="width:470px;height:225px;">#Attributes.Description#</textarea></td>
	</tr>
	<tr>
		<td class="FieldLabel">Website URL</td>
		<td class="FieldInput"><textarea name="ExternalURL" rows="2" id="ExternalURL" style="width:470px;height:35px;font-size:14px;">#Attributes.ExternalURL#</textarea></td>
	</tr>
</table>
</form>
</cfoutput>