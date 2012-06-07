<cfparam name="Attributes.EntryType" default="">
<cfparam name="Attributes.BudgetDescription" default="">
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
	
	function saveBudget() {
		var nError = 0;
		var sBudgetDescription = $("#BudgetDescription").val();
		var nEntryType = $("#EntryType").val();
		var nAmount = $("#Amount").val();
		
		if(sBudgetDescription == "") {
			addError("You must enter a Description.",250,6000,4000);
			nError = nError + 1;
		}
		
		if(nEntryType == "") {
			addError("You must select an Entry Type.",250,6000,4000);
			nError = nError + 1;
		}
		
		if(nAmount == "") {
			addError("You must enter an Amount.",250,6000,4000);
			nError = nError + 1;
		} else {
			if(!($.IsNumeric(nAmount))) {
				addError("You must enter an numeric value for Amount.",250,6000,4000);
				nError = nError + 1;
			} else if(nAmount == 0) {
				addError("You must enter an Amount.",250,6000,4000);
				nError = nError + 1;
			}
		}
		
		if(nError > 0) {
			return false;
		}
	
		$.blockUI( '<h1>Saving Budget Entry...</h1>' );
		$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc",
			{ method: "saveBudget", BudgetID: nId, ActivityID: nActivity, Description: sBudgetDescription, EntryType: nEntryType, Amount: nAmount, returnFormat: "plain" },
				function(data) {					
					if(data.STATUS) {
						updateBudget(nId);
						$.unblockUI();
					} else if(status == "Fail") {
						addError(data.STATUSMSG,250,6000,4000);
						$.unblockUI();
					}
				
		});
	}
	
	$(document).ready(function() {
		$("#BudgetInput td input,#BudgetInput td select").keyup(function(e) { 
			if(e.keyCode == 13) {
				saveBudget();
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
		<!--- Delete Method for the budgets --->
		$(".DeleteBudget").bind("click", this, function() {
			nId = this.id;
			
			if(confirm('Are you sure you would like to delete this budget entry?')) {
				$.blockUI( '<h1>Deleting Budget Entry...</h1>' );
				$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", 
				{ method: "deleteBudget", BudgetID: nId, ActivityID: nActivity, returnFormat: "plain" },
				function(data) {
					if(data.STATUS) {
						$("#BudgetRow" + nId).hide();
						updateBudget();
						updateActions();
						$.unblockUI();
					} else {
						addError(data.STATUSMSG,250,6000,4000);
						$.unblockUI();
					}
				});
			}
		});
	
		$("#SaveBudget").bind("click", this, function() {
			saveBudget();
		});
	});
</script>

<style>
tr.BudgetRow td { font-size:11px!important; }
</style>

<cfoutput>
<div class="ViewContainer">
<div class="ViewSection">
	<div class="ContentBody">
		<table width="100%" cellspacing="0" cellpadding="0" border="0" class="DataGrid">
			<thead>
				<tr>
					<th><a href="javascript:void(0);">Description</a></th>
					<th><a href="javascript:void(0);">Type</a></th>
					<th><a href="javascript:void(0);">Amount</a></th>
					<th><a href="javascript:void(0);">&nbsp;</a></th>
				</tr>
			</thead>
			<tbody>
                <tr id="BudgetInput">
                    <td><input type="text" name="BudgetDescription" id="BudgetDescription" value="#Attributes.BudgetDescription#"></td>
                    <td>
                        <select name="EntryType" id="EntryType">
                            <option value="">Select one...</option>
                            <cfloop query="qEntryTypeList">
                                <option value="#qEntryTypeList.EntryTypeID#"<cfif Attributes.EntryType EQ qEntryTypeList.EntryTypeID> SELECTED</cfif>>#qEntryTypeList.Name#</option>
                            </cfloop>
                        </select>
                    </td>
                    <td style="text-align:right;"><input type="text" name="Amount" id="Amount" value="#Attributes.Amount#"></td>
                    <td><a href="javascript://" id="SaveBudget"><img src="#Application.Settings.RootPath#/_images/icons/add.png" /></a></td>
                </tr>
				<cfloop query="qFinBudgetList">
					<cfset Attributes.TotalAmount = Attributes.TotalAmount + qFinBudgetList.Amount>
					
					<tr class="BudgetRow" id="BudgetRow#qFinBudgetList.BudgetID#">
						<td valign="top">#qFinBudgetList.Description#</td>
						<td valign="top">#qFinBudgetList.EntryTypeName#</td>
						<td valign="top" style="text-align:right;">#LSCurrencyFormat(qFinBudgetList.Amount)#</td>
						<td valign="top"><img src="#Application.Settings.RootPath#/_images/icons/bin.png" class="DeleteBudget" id="#qFinBudgetList.BudgetID#" style="cursor:pointer;" alt="Delete Entry" /></td>
					</tr>
				</cfloop>
				<tr>
					<td><strong>Total Entries:</strong> #qFinBudgetList.RecordCount#</td>
					<td style="text-align:right;"><strong>Total:</strong></td>
					<td style="text-align:right;">#LSCurrencyFormat(Attributes.TotalAmount)#</td>
					<td>&nbsp;</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</div>
</cfoutput>