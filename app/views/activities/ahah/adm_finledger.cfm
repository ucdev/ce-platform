<cfparam name="Attributes.EntryDate" default="#DateFormat(Now(),'MM/DD/YYYY')#">
<cfparam name="Attributes.EntryType" default="">
<cfparam name="Attributes.LedgerDescription" default="">
<cfparam name="Attributes.Memo" default="">
<cfparam name="Attributes.Amount" default="">
<cfparam name="Attributes.TotalAmount" default="0">

<script>
	<cfoutput>
	var nId = #Attributes.LedgerID#;
	</cfoutput>
	$("#date3").mask("99/99/9999");
	
	function saveLedger() {var nError = 0;
		var dtEntryDate = $("#date3").val();
		var sLedgerDescription = $("#LedgerDescription").val();
		var sMemo = $("#Memo").val();
		var nEntryType = $("#EntryType").val();
		var nAmount = $("#Amount").val();
		
		if(!($.IsDate(dtEntryDate))) {
			addError("You must enter an Entry Date.",250,6000,4000);
			nError = nError + 1;
		}
		
		if(sLedgerDescription == "") {
			addError("You must enter a Description.",250,6000,4000);
			nError = nError + 1;
		}
		
		if(nEntryType == "") {
			addError("You must select an Entry Type.",250,6000,4000);
			nError = nError + 1;
		}
		
		if(nAmount == "" || nAmount == 0) {
			addError("You must enter an Amount.",250,6000,4000);
			nError = nError + 1;
		}
		
		if(nError > 0) {
			return false;
		}
	
		$.blockUI( '<h1>Saving Ledger Entry...</h1>' );
		$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc",
			{ method: "saveLedger", EntryID: nId, ActivityID: nActivity, EntryDate: dtEntryDate, Description: sLedgerDescription, Memo: sMemo, EntryType: nEntryType, Amount: nAmount, returnFormat: "plain" },
				function(data) {
					if(data.STATUS) {
						updateActions();
						$.unblockUI();
						updateLedger(nId);
					} else if(status == "Fail") {
						addError(statusMsg,250,6000,4000);
						$.unblockUI();
					}
				
		});
	}
	
$(document).ready(function() {
	$("#date3").focus();
	
	$("#LedgerInput td input,#LedgerInput td select").keyup(function(e) {
		if(e.keyCode == 13) {
			saveLedger();
		}
	});
	
	$("#Amount").keyup(function() {
		if($(this).val() > 0) {
			$("#AmountImg").attr('src','/_images/icons/arrow_up.png');
		} else if($(this).val() < 0) {
			$("#AmountImg").attr('src','/_images/icons/arrow_down_gray.png');
		} else {
			$("#AmountImg").attr('src','/_images/icons/bullet_white.png');
		}
	});
	
	<!--- Delete Method for the ledgers --->
	$(".DeleteLedger").bind("click", this, function() {
		nId = this.id;
		
		if(confirm('Are you sure you would like to delete this ledger entry?')) {
			$.blockUI( '<h1>Deleting Ledger Entry...</h1>' );
			$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", { method: "deleteLedger", EntryID: nId, ActivityID: nActivity, returnFormat: "plain" },
				function(data) {
					if(data.STATUS) {
						$("#LedgerRow" + nId).hide();
						updateActions();
						updateLedger(nId);
					} else {
						addError(statusMsg,250,6000,4000);
					}
					
					$.unblockUI();
			});
		}
	});
	
	$("#SaveLedger").bind("click", this, function() {
		saveLedger();
	});
});
</script>

<style>
tr.LedgerRow td { font-size:11px!important; }
</style>

<cfoutput>
<div class="ViewContainer">
<div class="ViewSection">
	<div class="ContentBody">
		<table width="100%" cellspacing="0" cellpadding="0" border="0" class="DataGrid">
			<thead>
				<tr>
					<th><a href="javascript:void(0);">Date</a></th>
					<th><a href="javascript:void(0);">Description</a></th>
					<th><a href="javascript:void(0);">Memo</a></th>
					<th><a href="javascript:void(0);">Type</a></th>
					<th><a href="javascript:void(0);">Amount</a></th>
					<th><a href="javascript:void(0);">&nbsp;</a></th>
					<th><a href="javascript:void(0);">&nbsp;</a></th>
				</tr>
			</thead>
			<tbody>
                <input type="hidden" name="LedgerID" id="LedgerID" value="#Attributes.LedgerID#" />
                <tr id="LedgerInput">
                    <td style="text-align:center;" nowrap="nowrap"><input type="text" name="EntryDate" id="date3" value="#Attributes.EntryDate#" style="width:60px; font-size:10px;"></td>
                    <td><input type="text" name="LedgerDescription" id="LedgerDescription" value="#Attributes.LedgerDescription#" style="width:90px; font-size:10px;"></td>
                    <td><input type="text" name="Memo" id="Memo" value="#Attributes.Memo#" style="width:90px; font-size:10px;"></td>
                    <td>
                        <select name="EntryType" id="EntryType" style="font-size:10px;">
                            <option value="">Select one...</option>
                            <cfloop query="qEntryTypeList">
                                <option value="#qEntryTypeList.EntryTypeID#"<cfif Attributes.EntryType EQ qEntryTypeList.EntryTypeID> SELECTED</cfif>>#qEntryTypeList.Name#</option>
                            </cfloop>
                        </select>
                    </td>
                    <td style="text-align:right;"><input type="text" name="Amount" id="Amount" value="#Attributes.Amount#" style="width:55px;font-size:10px;text-align:right;"></td>
                    <td style="text-align:center;"><img src="#Application.Settings.RootPath#/_images/icons/bullet_white.png" border="0" id="AmountImg" style="display:none;" /></td>
                    <td><a href="javascript://" id="SaveLedger"><img src="#Application.Settings.RootPath#/_images/icons/add.png" /></a></td>
                </tr>
				<cfloop query="qFinLedgerList">
					<cfset Attributes.TotalAmount = Attributes.TotalAmount + qFinLedgerList.Amount>
					
					<tr class="LedgerRow" id="LedgerRow#qFinLedgerList.EntryID#">
						<td valign="top" style="text-align:center;">#DateFormat(qFinLedgerList.EntryDate,"MM/DD/YYYY")#</td>
						<td valign="top">#qFinLedgerList.Description#</td>
						<td valign="top">#qFinLedgerList.Memo#</td>
						<td valign="top">#qFinLedgerList.EntryTypeName#</td>
						<td valign="top" style="text-align:right;color:<cfif qFinLedgerList.Amount GT 0>GREEN<cfelse>BLACK</cfif>;">#LSCurrencyFormat(qFinLedgerList.Amount)#</td>
						<td valign="top"><cfif qFinLedgerList.Amount GT 0><img src="#Application.Settings.RootPath#/_images/icons/arrow_up.png" border="0" /><cfelse><img src="#Application.Settings.RootPath#/_images/icons/arrow_down_gray.png" border="0" /></cfif></td>
						<td valign="top"><img src="#Application.Settings.RootPath#/_images/icons/bin.png" class="DeleteLedger" id="#qFinLedgerList.EntryID#" style="cursor:pointer;" alt="Delete Entry" /></td>
					</tr>
				</cfloop>
				<tr>
					<td colspan="3"><strong>Total Entries:</strong> #qFinLedgerList.RecordCount#</td>
					<td style="text-align:right;"><strong>Total:</strong></td>
					<td style="text-align:right;color:<cfif Attributes.TotalAmount GT 0>GREEN<cfelse>BLACK</cfif>;">#LSCurrencyFormat(Attributes.TotalAmount)#</td>
					<td><cfif Attributes.TotalAmount GT 0><img src="#Application.Settings.RootPath#/_images/icons/arrow_up.png" border="0" /><cfelse><img src="#Application.Settings.RootPath#/_images/icons/arrow_down_gray.png" border="0" /></cfif></td>
					<td>&nbsp;</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</div>
</cfoutput>