<cfparam name="Attributes.EntryDate" default="#DateFormat(Now(),'MM/DD/YYYY')#">
<cfparam name="Attributes.EntryType" default="">
<cfparam name="Attributes.LedgerDescription" default="">
<cfparam name="Attributes.Memo" default="">
<cfparam name="Attributes.Amount" default="">
<cfparam name="Attributes.TotalAmount" default="0">

<script>
	var nId = 0;
	
	function updateLedger(nId) {
		$("#LedgerLoading").show();
		
		$.post(sMyself + "Activity.FinLedgerAHAH", { ActivityID: nActivity, LedgerID: nId }, 
			function(data) {
				$("#LedgerContainer").html(data);
				$("#LedgerLoading").hide();
		});
	}
	
	$(document).ready(function() {
		updateLedger(nId);
		
		$("#LedgerInput td input,#LedgerInput td select").keyup(function(e) { 
			if(e.keyCode == 13) {
				SubmitForm(document.frmGenLedger);
			}
		});
	});
</script>

<div class="ViewSection">
	<h3>General Ledger</h3>
	<div id="LedgerContainer"></div>
	<div id="LedgerLoading" class="Loading"><img src="/admin/_images/ajax-loader.gif" />
	<div>Please Wait</div>
	</div>
</div>