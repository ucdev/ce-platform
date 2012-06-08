<cfparam name="Attributes.Name" default="">
<cfparam name="Attributes.FeeStartDate" default="">
<cfparam name="Attributes.FeeStartTime" default="">
<cfparam name="Attributes.FeeEndDate" default="">
<cfparam name="Attributes.FeeEndTime" default="">
<cfparam name="Attributes.Amount" default="">
<cfparam name="Attributes.TotalAmount" default="0">

<script>
	var nId = 0;
	
	function updateFees(nId) {
		$("#FeesLoading").show();
		
		$.post(sMyself + "Activity.FinFeesAHAH?ActivityID=" + nActivity + "&FeeID=" + nId, function(data) {
			$("#FeesContainer").html(data);
			$("#FeesLoading").hide();
		});
	}
	
	$(document).ready(function() {
		updateFees();
		
		$("#FeeInput td input,#FeeInput td select").keyup(function(e) { 
			if(e.keyCode == 13) {
				SubmitForm(document.frmFee);
			}
		});
	});
</script>

<cfoutput>
<div class="ViewSection">
	<h3>Fees</h3>
	<div id="FeesContainer"></div>
	<div id="FeesLoading" class="Loading"><img src="/admin/_images/ajax-loader.gif" />
	<div>Please Wait</div>
	</div>
</div>
</cfoutput>