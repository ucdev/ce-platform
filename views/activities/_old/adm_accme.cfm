<cfoutput>
<h4>ACCME</h4><!---
<cfinclude template="#Application.Settings.RootPath#/View/Includes/SaveJS.cfm" />--->
<div class="ViewSection">
<h3>ACCME Information</h3>
<script>
$(document).ready(function() {
});
</script>
<cfoutput>
<form action="#Application.Settings.RootPath#/_com/AJAX_Activity.cfc" method="post" name="frmEditActivity" id="EditForm">
    <cfinclude template="#Application.Settings.RootPath#/View/Includes/SaveInfo.cfm" />
    <input type="hidden" name="activityId" value="#attributes.activityId#" />
    <input type="hidden" value="saveACCMEInfo" name="Method" />
    <input type="hidden" value="plain" name="returnFormat" />
    <input type="hidden" value="" name="ChangedFields" id="ChangedFields" />
    <input type="hidden" value="" name="ChangedValues" id="ChangedValues" />
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ViewSectionGrid">
		<tbody>
			<tr>
            	<td>Designed to Change Competence</td>
            	<td>
                	<select name="competenceDesign" id="competenceDesign">
                    	<option value="0"<cfif isDefined("attributes.competenceDesign") AND attributes.competenceDesign EQ 0> SELECTED</cfif>>No</option>
                    	<option value="1"<cfif isDefined("attributes.competenceDesign") AND attributes.competenceDesign EQ 1> SELECTED</cfif>>Yes</option>
                	</select>
                </td>
			</tr>
			<tr>
            	<td>Designed to Change Performance</td>
            	<td>
                	<select name="performanceDesign" id="performanceDesign">
                    	<option value="0"<cfif isDefined("attributes.performanceDesign") AND attributes.performanceDesign EQ 0> SELECTED</cfif>>No</option>
                    	<option value="1"<cfif isDefined("attributes.performanceDesign") AND attributes.performanceDesign EQ 1> SELECTED</cfif>>Yes</option>
                	</select>
                </td>
			</tr>
			<tr>
            	<td>Designed to Change Patient Outcomes</td>
            	<td>
                	<select name="outcomesDesign" id="outcomesDesign">
                    	<option value="0"<cfif isDefined("attributes.outcomesDesign") AND attributes.outcomesDesign EQ 0> SELECTED</cfif>>No</option>
                    	<option value="1"<cfif isDefined("attributes.outcomesDesign") AND attributes.outcomesDesign EQ 1> SELECTED</cfif>>Yes</option>
                	</select>
                </td>
			</tr>
			<tr>
            	<td>Changes in Competence Evaluated</td>
            	<td>
                	<select name="competenceEval" id="competenceEval">
                    	<option value="0"<cfif isDefined("attributes.competenceEval") AND attributes.competenceEval EQ 0> SELECTED</cfif>>No</option>
                    	<option value="1"<cfif isDefined("attributes.competenceEval") AND attributes.competenceEval EQ 1> SELECTED</cfif>>Yes</option>
                	</select>
                </td>
			</tr>
			<tr>
            	<td>Changes in Performance Evaluated</td>
            	<td>
                	<select name="performanceEval" id="performanceEval">
                    	<option value="0"<cfif isDefined("attributes.performanceEval") AND attributes.performanceEval EQ 0> SELECTED</cfif>>No</option>
                    	<option value="1"<cfif isDefined("attributes.performanceEval") AND attributes.performanceEval EQ 1> SELECTED</cfif>>Yes</option>
                	</select>
                </td>
			</tr>
			<tr>
            	<td>Changes in Patient Outcomes Evaluated</td>
            	<td>
                	<select name="outcomesEval" id="outcomesEval">
                    	<option value="0"<cfif isDefined("attributes.outcomesEval") AND attributes.outcomesEval EQ 0> SELECTED</cfif>>No</option>
                    	<option value="1"<cfif isDefined("attributes.outcomesEval") AND attributes.outcomesEval EQ 1> SELECTED</cfif>>Yes</option>
                	</select>
                </td>
			</tr>
		</tbody>
	</table>
</form>
</cfoutput>
</div>
</cfoutput>