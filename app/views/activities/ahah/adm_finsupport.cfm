<cfparam name="Attributes.TotalAmount" default="0">

<script>
<Cfoutput>
// BUILD SUPPORTER ARRAY
aSupporters = new Array();
<cfif qActivitySupportersList.RecordCount NEQ 0>
	<cfset i = 1>
	<cfloop query="qActivitySupportersList">
		<cfset Attributes.TotalAmount = Attributes.TotalAmount + qActivitySupportersList.Amount>
		aSupporters[#qActivitySupportersList.SupportID#] = #qActivitySupportersList.Amount#;
		<cfset i = i++>
	</cfloop>
	nTotalSupportAmount = #Attributes.TotalAmount#;
</cfif>
</cfoutput>
$(document).ready(function() {
	/* EDIT CURRENT SUPPORTER DIALOG FUNCTIONS START */
		// OPEN DIALOG
		$(".EditCurrSupport").bind("click", this, function() {
			nCurrSupporter = this.id.split('|')[0];
			
			$("#frmEditCurrSupport").attr("src",sMyself + "Activity.EditCurrSupport?ActivityID=" + nActivity + "&SupportID=" + nCurrSupporter);
			$("#EditSupportRecord").dialog("open");
		});
			
			// EDIT CURRENT SUPPORTER DIALOG
			$("#EditSupportRecord").dialog({ 
				title:"Edit Supporter",
				modal: true, 
				autoOpen: false,
				resizable: false,
				height:350,
				width:475,
				position: [100,100],
				open:function() {
					$("#EditSupportRecord").show();
				},
				close:function() {
					window.location.reload();
				},
				buttons: { 
					Continue:function() {
						window.frames.frmEditCurrSupport.document.formEditCurrSupport.submit();
					}, 
					Cancel:function() {
						$(this).dialog("close");
					}
				}
			});
	/* EDIT CURRENT SUPPORTER DIALOG FUNCTIONS END */
	
	/* DELETE CURRENT SUPPORT RECORD FUNCTION START */
			$(".DeleteSupport").bind("click", this, function() {
				nId = $.ListGetAt(this.id,1,"|");
				
				if(confirm('Are you sure you would like to delete this budget entry?')) {
					$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", { method: "deleteSupport", SupportID: nId, ActivityID: nActivity, returnFormat: "plain" },
						function(data) {
							if(data.STATUS) {
								if(nTotalSupportCount != 1) {
									nTotalSupportCount = nTotalSupportCount - 1;
								} else {
									nTotalSupportCount = "0";
								}
								
								// GET TOTAL AMOUNT AND FORMAT NUMBER
								nTotalSupportAmount = nTotalSupportAmount - aSupporters[nId];
								TempSupportAmount = $.DollarFormat(nTotalSupportAmount);
								
								// UPDATE TOTAL ENTRIES AND TOTAL AMOUNT
								$("#TotalSupportCount").html(nTotalSupportCount);
								$("#TotalSupportAmount").html(TempSupportAmount);
								$("#SupporterRow" + nId).hide();
								updateStats();
							} else {
								addError(data.STATUSMSG,250,6000,4000);
							}
					});
				}
			});
	/* DELETE CURRENT SUPPORT RECORD FUNCTION END */
});
</script>

<cfoutput>
<div class="ViewContainer">
<div class="ViewSection">
    <div class="ContentBody">
        <table width="100%" cellspacing="0" cellpadding="0" border="0" class="DataGrid">
            <cfloop query="qActivitySupportersList">
                
                <tr class="SupporterRow" id="SupporterRow#qActivitySupportersList.SupportID#">
                    <td valign="top">#qActivitySupportersList.SupporterName#</td>
                    <td valign="top">#qActivitySupportersList.SupportTypeName#</td>
                    <td valign="top" style="text-align:right;">#LSCurrencyFormat(qActivitySupportersList.Amount)#</td>
                    <td valign="top"><img src="#Application.Settings.RootPath#/_images/icons/pencil.png" class="EditCurrSupport" id="#qActivitySupportersList.SupportID#|#qActivitySupportersList.Amount#" style="cursor:pointer;" alt="Edit Entry" title="Edit Entry" /></td>
                    <td valign="top"><img src="#Application.Settings.RootPath#/_images/icons/bin.png" class="DeleteSupport" id="#qActivitySupportersList.SupportID#|#qActivitySupportersList.Amount#" style="cursor:pointer;" alt="Delete Entry" title="Delete Entry" /></td>
                </tr>
            </cfloop>
            <tr>
                <td><strong>Total Entries:</strong> <span id="TotalSupportCount">#qActivitySupportersList.RecordCount#</span></td>
                <td style="text-align:right;"><strong>Total:</strong></td>
                <td style="text-align:right;"><span id="TotalSupportAmount">#LSCurrencyFormat(Attributes.TotalAmount)#</span></td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
</div>
</div>
</cfoutput>
<div id="EditSupporterContainer" style="display:none;">
	<iframe src="" name="frmEditSupporter" id="frmEditSupporter" frameborder="0" width="100%" height="100%" scrolling="no"></iframe>
</div>
<div id="EditSupportRecord" style="display:none;">
	<iframe src="" name="frmEditCurrSupport" id="frmEditCurrSupport" frameborder="0" width="100%" height="100%" scrolling="no"></iframe>
</div>