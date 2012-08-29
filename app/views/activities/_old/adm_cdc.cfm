<cfoutput>
<div class="ViewSection">
<h3>CDC Information</h3>
<form name="frmOther" method="Post" action="#Myself#Activity.CDCInfo?ActivityID=#Attributes.ActivityID#&Submitted=1">
<table>
	<tr>
		<td>Didactic Hours</td>
		<td><input type="text" name="DidacticHrs" value="#Attributes.DidacticHrs#" id="DidacticHrs" /> Hr</td>
	</tr>
	<tr>
		<td>Experimental Hours</td>
		<td><input type="text" name="ExperimentalHrs" value="#Attributes.ExperimentalHrs#" id="ExperimentalHrs" /> Hr</td>
	</tr>
	<tr>
		<td>Sponsered by Second Clinical Site?</td>
		<td>
			<select name="SecClinSiteFlag" id="SecClinSiteFlag">
				<option value="">Select One...</option>
				<option value="Y"<cfif Attributes.SecClinSiteFlag EQ "Y"> SELECTED</cfif>>Yes</option>
				<option value="N"<cfif Attributes.SecClinSiteFlag EQ "N"> SELECTED</cfif>>No</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>Provided in Collaboration with another PTC?</td>
		<td>
			<select name="CollabPTCFlag" id="CollabPTCFlag">
				<option value="">Select One...</option>
				<option value="Y"<cfif Attributes.CollabPTCFlag EQ "Y"> SELECTED</cfif>>Yes</option>
				<option value="N"<cfif Attributes.CollabPTCFlag EQ "N"> SELECTED</cfif>>No</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>If so, specify PTC and Part</td>
		<td><input type="text" name="CollabPTCSpecify" value="#Attributes.CollabPTCSpecify#" id="CollabPTCSpecify" /></td>
	</tr>
	<tr>
		<td>Provided in Collaboration with another agency?</td>
		<td>
			<select name="CollabAgencyFlag" id="CollabAgencyFlag">
				<option value="">Select One...</option>
				<option value="Y"<cfif Attributes.CollabAgencyFlag EQ "Y"> SELECTED</cfif>>Yes</option>
				<option value="N"<cfif Attributes.CollabAgencyFlag EQ "N"> SELECTED</cfif>>No</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>If so, specify which agency</td>
		<td><input type="text" name="CollabAgencySpecify" value="#Attributes.CollabAgencySpecify#" id="CollabAgencySpecify" /></td>
	</tr>
</table>
</form>
</div>
</cfoutput>