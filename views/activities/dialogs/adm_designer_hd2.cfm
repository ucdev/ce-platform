<cfparam name="Attributes.ActivityID" default="" />
<cfparam name="Attributes.PubComponentID" default="" />
<cfparam name="Attributes.DisplayName" default="" />
<cfparam name="Attributes.Description" default="" />

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
<input type="hidden" name="ComponentID" value="17" />
<input type="hidden" name="returnformat" value="plain" />
<table width="100%" cellspacing="1" cellpadding="3">
	<tr>
		<td class="FieldInput"><input type="text" name="DisplayName" id="DisplayName" value="#Attributes.DisplayName#" style="width:440px;" /></td>
	</tr>
</table>
</form>
</cfoutput>