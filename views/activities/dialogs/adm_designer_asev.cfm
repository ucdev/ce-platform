<cfparam name="Attributes.AssessmentID" default="0" />
<cfparam name="Attributes.DisplayName" default="" />
<cfparam name="Attributes.Description" default="" />
<cfparam name="Attributes.RequiredFlag" default="Y" />
<cfparam name="Attributes.ActivityID" default="0" />

<script>
$(document).ready(function() {
	$("#DisplayName").select();
	
	$("a.CreateTemplate").click(function() {
		var nComponent = $.ListGetAt(this.id,2,'|');
		var sName = prompt("Please provide a name for this template.");
		
		$.post(sRootPath + "/_com/ajax_builder.cfc" , { Method: 'saveAssessTmpl', PubComponentID: nComponent, Name: sName, returnFormat: 'plain' },
			function(data) {
				var cleanData = $.Trim(data);
				var status = $.ListGetAt(cleanData, 1, "|");
				var statusMsg = $.ListGetAt(cleanData, 2, "|");
				
				if(status == "Success") {
					$(".CreateTemplate").hide();
					$(".DeleteTemplate").show();
					addMessage(statusMsg,250,6000,4000);
				} else {
					addError(statusMsg,250,6000,4000);
				}
		});
	});
	
	$("a.DeleteTemplate").click(function() {
		var nComponent = $.ListGetAt(this.id,2,'|');
		
		$.post(sRootPath + "/_com/AJAX_Builder.cfc" , { Method: 'deleteAssessTmpl', PubComponentID: nComponent, returnFormat: 'plain' },
			function(data) {
				var cleanData = $.Trim(data);
				var status = $.ListGetAt(cleanData, 1, "|");
				var statusMsg = $.ListGetAt(cleanData, 2, "|");
				
				if(status == "Success") {
					$(".DeleteTemplate").hide();
					$(".CreateTemplate").show();
					addMessage(statusMsg,250,6000,4000);
				} else {
					addError(statusMsg,250,6000,4000);
				}
		});
	});
});
</script>

<cfoutput>
<form action="#Application.Settings.RootPath#/_com/AJAX_Builder.cfc" method="post" id="frmComp-#Attributes.PubComponentID#" name="frmComp-#Attributes.PubComponentID#">
	<input type="hidden" name="PubComponentID" value="#Attributes.PubComponentID#" />
	<input type="hidden" name="method" value="saveComponent" />
	<input type="hidden" name="ActivityID" value="#Attributes.ActivityID#" />
	<input type="hidden" name="ComponentID" value="5" />
	<input type="hidden" name="returnformat" value="plain" />
	<input type="hidden" name="AssessmentID" value="#Attributes.AssessmentID#" />
<table width="100%" cellspacing="1" border="0" cellpadding="2">
	<tr>
		<td class="FieldLabel" valign="top" width="150">Heading</td>
		<td class="FieldInput">
			<input type="text" name="DisplayName" id="DisplayName" value="#Attributes.DisplayName#" style="width:440px;" />
		</td>
	</tr>
	<tr class="Details">
		<td class="FieldLabel" valign="top" width="150">Description</td>
		<td class="FieldInput">
			<textarea name="Description" id="Description" style="width:440px;height:225px;">#Attributes.Description#</textarea>
		</td>
	</tr>
	<tr class="RequiredFlag">
		<td class="FieldLabel">Required?</td>
		<td class="FieldInput">
			<input type="radio" name="RequiredFlag" id="RequiredYes" value="Y"<cfif Attributes.RequiredFlag EQ "Y"> checked</cfif> /> Yes <input type="radio" name="RequiredFlag" id="RequiredNo" value="N"<cfif Attributes.RequiredFlag EQ "N"> checked</cfif> /> No
		</td>
	</tr>
</table>
<cfif Attributes.AssessmentID EQ 0>
<hr />
OR Choose a template
<select name="AssessTmplID" id="AssessTmplID">
	<option value="0">Select one...</option>
    <cfloop query="qTemplates">
	<option value="#qTemplates.AssessTmplID#">#qTemplates.Name#</option>
    </cfloop>
</select>
<cfelse>
	<cfif NOT ListFind(TemplatedAssessments, Attributes.AssessmentID, ",")>
        <a href="javascript:void(0);" class="CreateTemplate" id="Template|#Attributes.PubComponentID#" style="text-decoration:none;"><img src="#Application.Settings.RootPath#/_images/icons/add.png" align="absmiddle" style="padding-right:2px;" />Save Template</a>
        <a href="javascript:void(0);" class="DeleteTemplate" id="Template|#Attributes.PubComponentID#" style="text-decoration:none; display: none;"><img src="#Application.Settings.RootPath#/_images/icons/delete.png" align="absmiddle" style="padding-right:2px;" />Delete Template</a>
    <cfelse>
        <a href="javascript:void(0);" class="CreateTemplate" id="Template|#Attributes.PubComponentID#" style="text-decoration:none; display: none;"><img src="#Application.Settings.RootPath#/_images/icons/add.png" align="absmiddle" style="padding-right:2px;" />Save Template</a>
        <a href="javascript:void(0);" class="DeleteTemplate" id="Template|#Attributes.PubComponentID#" style="text-decoration:none;"><img src="#Application.Settings.RootPath#/_images/icons/delete.png" align="absmiddle" style="padding-right:2px;" />Delete Template</a>
    </cfif>
</cfif>
</form>
</cfoutput>