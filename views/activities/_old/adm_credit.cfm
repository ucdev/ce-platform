<cfparam name="Attributes.Credits" default="">
<div class="ViewSection">
<h3>Credits</h3>
<script>
function updateCreditRow(elem) {
	var nCreditID = $(elem).attr('id').split('Credits')[1];
	if($(elem).attr("checked")) {
		$("#CreditAmount" + nCreditID).attr("disabled",false);
		$("#ReferenceNo" + nCreditID).attr("disabled",false);
	} else {
		$("#CreditAmount" + nCreditID).attr("disabled",true);
		$("#ReferenceNo" + nCreditID).attr("disabled",true);
	}
}

$(document).ready(function() {
	$(".CreditBox").each(function() {
		updateCreditRow(this);
	});
	
	$(".CreditBox").click(function() {
		updateCreditRow(this);
	});
});
</script>
<cfoutput>
<form name="frmAddCredits" method="post" action="/activities/adm_credit/#Attributes.ActivityID#">
	<input type="hidden" name="Submitted" value="1" />
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ViewSectionGrid">
		<thead>
			<tr>
				<th style="text-align:center;">&nbsp;</th>
				<th>Type</th>
				<th>Amount</th>
				<th>Reference No</th>
			</tr>
		</thead>
		<tbody>
			<cfloop query="qCredits">
                <tr>
                    <td style="width:10px;"><input type="checkbox" class="CreditBox" name="Credits" id="Credits#qCredits.creditid#" value="#qCredits.creditid#"<cfif ListFind(params.Credits,qCredits.creditid,",")> checked</cfif> /></td>
                    <td width="100"><label for="Credits#qCredits.creditid#">#qCredits.Name#</label></td>
                    <td width="40"><input type="text" name="CreditAmount#qCredits.creditid#" id="CreditAmount#qCredits.creditid#" value="#Evaluate('params.CreditAmount#qCredits.creditid#')#" style="width:34px;" /></td>
                    <td><cfif qCredits.ReferenceFlag EQ "Y"><input type="text" name="ReferenceNo#qCredits.creditid#" id="ReferenceNo#qCredits.creditid#" value="#Evaluate('params.ReferenceNo#qCredits.creditid#')#" /><cfelse>&nbsp;</cfif></td>
                </tr>
			</cfloop>
		</tbody>
	</table>
</form>
</cfoutput>
</div>