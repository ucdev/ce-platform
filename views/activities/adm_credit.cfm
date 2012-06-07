<cfparam name="Attributes.Credits" default="">
<div class="ViewSection">
<h3>Credits</h3>
<script>
$(document).ready(function() {
	$(".CreditBox").each(function() {
		var nCreditID = $.Replace(this.id,"Credits","","ALL");
		if($(this).attr("checked")) {
			$("#CreditAmount" + nCreditID).attr("disabled",false);
			$("#ReferenceNo" + nCreditID).attr("disabled",false);
		} else {
			$("#CreditAmount" + nCreditID).attr("disabled",true);
			$("#ReferenceNo" + nCreditID).attr("disabled",true);
		}
	});
	
	$(".CreditBox").click(function() {
		var nCreditID = $.Replace(this.id,"Credits","","ALL");
		if($(this).attr("checked")) {
			$("#CreditAmount" + nCreditID).attr("disabled",false);
			$("#ReferenceNo" + nCreditID).attr("disabled",false);
		} else {
			$("#CreditAmount" + nCreditID).attr("disabled",true);
			$("#ReferenceNo" + nCreditID).attr("disabled",true);
		}
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
                    <td style="width:10px;"><input type="checkbox" class="CreditBox" name="Credits" id="Credits#qCredits.id#" value="#credits.id#"<cfif ListFind(params.Credits,qCredits.id,",")> checked</cfif> /></td>
                    <td width="100"><label for="Credits#qCredits.id#">#qCredits.Name#</label></td>
                    <td width="40"><input type="text" name="CreditAmount#qCredits.id#" id="CreditAmount#qCredits.id#" value="#Evaluate('params.CreditAmount#qCredits.id#')#" style="width:34px;" /></td>
                    <td><cfif qCredits.ReferenceFlag EQ "Y"><input type="text" name="ReferenceNo#qCredits.id#" id="ReferenceNo#qCredits.id#" value="#Evaluate('params.ReferenceNo#qCredits.id#')#" /><cfelse>&nbsp;</cfif></td>
                </tr>
			</cfloop>
		</tbody>
	</table>
</form>
</cfoutput>
</div>