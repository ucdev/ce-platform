<cfparam name="Attributes.EntryType" default="">
<cfparam name="Attributes.Description" default="">
<cfparam name="Attributes.Amount" default="">
<cfparam name="Attributes.TotalAmount" default="0">

<script>
	var nId = 0;
	
	function updateBudget(nId) {
		$("#BudgetLoading").show();
		
		$.post(sMyself + "Activity.FinBudgetAHAH", { ActivityID: nActivity, BudgetID: nId }, 
			function(data) {
				$("#BudgetContainer").html(data);
				$("#BudgetLoading").hide();
		});
	}
	$(document).ready(function() {
		updateBudget(nId);
		
		$("#BudgetInput td input,#BudgetInput td select").keyup(function(e) { 
			if(e.keyCode == 13) {
				SubmitForm(document.frmBudget);
			}
		});
	});
</script>

<div class="ViewSection">
	<h3>Budget</h3>
	<div id="BudgetContainer"></div>
	<div id="BudgetLoading" class="Loading"><img src="/admin/_images/ajax-loader.gif" />
	<div>Please Wait</div>
	</div>
</div>