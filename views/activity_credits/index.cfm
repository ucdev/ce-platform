<cfparam name="Attributes.Credits" default="">
<cfoutput>
<cfinclude template="/lib/savejs.cfm" />
#startFormTag(name="frmAddCredits", id="EditForm", action="save", key=params.key)#
<cfinclude template="/lib/saveinfo.cfm" />
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ViewSectionGrid">
		<thead>
			<tr>
				<th class="span2" style="text-align:center;">&nbsp;</th>
				<th class="span3">Type</th>
				<th class="span3">Amount</th>
				<th class="span6">Reference No</th>
			</tr>
		</thead>
		<tbody>
			<cfloop query="qCredits">
                <tr>
                    <td><input type="checkbox" class="js-check-box" name="Credits" id="credits-#qCredits.creditid#" value="#qCredits.creditid#"<cfif ListFind(params.Credits,qCredits.creditid,",")> checked</cfif> /></td>
                    <td><label for="Credits#qCredits.creditid#">#qCredits.Name#</label></td>
                    <td><input type="text" name="CreditAmount[#qCredits.creditid#]" class="span2 js-amount-#qCredits.creditId#" id="CreditAmount#qCredits.creditid#" value="#Evaluate('params.CreditAmount#qCredits.creditid#')#" /></td>
                    <td><cfif qCredits.ReferenceFlag EQ "Y"><input type="text" name="ReferenceNo[#qCredits.creditid#]" class="js-reference-#qCredits.creditId#" id="ReferenceNo#qCredits.creditid#" value="#Evaluate('params.ReferenceNo#qCredits.creditid#')#" /><cfelse>&nbsp;</cfif></td>
                </tr>
			</cfloop>
		</tbody>
	</table>
</form>
</cfoutput>