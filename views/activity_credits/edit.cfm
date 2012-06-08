<cfparam name="Attributes.Credits" default="">
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
<form name="frmAddCredits" method="post" action="#urlFor(action='save')#">
	<div class="btn-toolbar well well-small clearfix">
		<div class="btn-group pull-left">
		<input type="submit" value="Save Now" name="btnSave" id="btnSave" class="btn btn-primary" />
		</div>
		<div class="btn-group pull-left">
		<input style="display:none;" type="reset" value="Discard" name="btnDiscard" id="btnDiscard" class="btn" />
		</div>
		<div class="btn-group pull-left">
		<span class="SaveInfo" id="SaveInfo"></span>
		</div>
	</div>
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