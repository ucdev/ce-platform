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
			<cfloop query="credits">
                <tr>
                    <td style="width:10px;"><input type="checkbox" class="CreditBox" name="Credits" id="Credits#credits.id#" value="#credits.id#"<cfif ListFind(params.Credits,credits.id,",")> checked</cfif> /></td>
                    <td width="100"><label for="Credits#credits.id#">#credits.Name#</label></td>
                    <td width="40"><input type="text" name="CreditAmount#credits.id#" id="CreditAmount#credits.id#" value="#Evaluate('params.CreditAmount#credits.id#')#" style="width:34px;" /></td>
                    <td><cfif credits.ReferenceFlag EQ "Y"><input type="text" name="ReferenceNo#credits.id#" id="ReferenceNo#credits.id#" value="#Evaluate('params.ReferenceNo#credits.id#')#" /><cfelse>&nbsp;</cfif></td>
                </tr>
			</cfloop>
		</tbody>
	</table>
</form>
</cfoutput>
</div>