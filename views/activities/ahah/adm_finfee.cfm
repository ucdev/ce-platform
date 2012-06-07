<cfparam name="Attributes.Name" default="">
<cfparam name="Attributes.FeeStartDate" default="">
<cfparam name="Attributes.FeeStartTime" default="">
<cfparam name="Attributes.FeeEndDate" default="">
<cfparam name="Attributes.FeeEndTime" default="">
<cfparam name="Attributes.Amount" default="">
<cfparam name="Attributes.TotalAmount" default="0">
<script>
	var nId = 0;
	
	function saveFee() {
		var nFee = $("#FeeID").val();
		var sName = $("#Name").val();
		var dtStartDate = $("#FeeStartDate").val();
		var dtEndDate = $("#FeeEndDate").val();
		var dtStartTime = $("#FeeStartTime").val();
		var dtEndTime = $("#FeeEndTime").val();
		var nAmount = $("#Amount").val();
		
		$.blockUI( '<h1>Adding Fee...</h1>' );
			
		if($("#FeeID").val() != "" && $("#FeeID").val() != 'undefined') {
			$.post(sRootPath + "/_com/AJAX_Activity.cfc", 
				{ method: "saveFee", ActivityID: nActivity, FeeID: nFee, Name: sName, StartDate: dtStartDate, EndDate: dtEndDate, StartTime: dtStartTime, EndTime: dtEndTime, Amount: nAmount, returnFormat: "plain" },
				function(returnData) {
					cleanData = $.trim(returnData);
					status = $.ListGetAt(cleanData,1,"|");
					statusMsg = $.ListGetAt(cleanData,2,"|");
					
					if(status == 'Success') {
						$.unblockUI();
						updateFees();
					} else {
						<!--- ERROR OUTPUT --->
						for(i=1;i<=$.ListLen(cleanData,"|");i=i+1) {
							addError($.ListGetAt(cleanData,i,"|"),250,6000,4000);
						};
						
						$.unblockUI();
					}
				});
		} else {
			$.post(sRootPath + "/_com/AJAX_Activity.cfc", 
				{ method: "saveFee", ActivityID: nActivity, Name: $("#Name").val(), StartDate: $("#FeeStartDate").val(), EndDate: $("#FeeEndDate").val(), StartTime: $("#FeeStartTime").val(), EndTime: $("#FeeEndTime").val(), Amount: $("#Amount").val(), returnFormat: "plain" },
				function(returnData) {
					cleanData = $.trim(returnData);
					status = $.ListGetAt(cleanData,1,"|");
					statusMsg = $.ListGetAt(cleanData,2,"|");
					
					if(status == 'Success') {
						updateFees();
						$.unblockUI();
					} else {
						<!--- ERROR OUTPUT --->
						for(i=1;i<=$.ListLen(cleanData,"|");i=i+1) {
							addError($.ListGetAt(cleanData,i,"|"),250,6000,4000);
						};
						
						$.unblockUI();
					}
				});
		}
	}
	
	$(document).ready(function() {
		$(".DatePicker").datepicker({ 
			showOn: "button", 
			buttonImage: "/admin/_images/icons/calendar.png", 
			buttonImageOnly: true,
			showButtonPanel: true,
			changeMonth: true,
			changeYear: true
		});
		
		$("#FeeStartDate").mask("99/99/9999");
		$("#FeeStartTime").mask("99:99 aa");
		$("#FeeEndDate").mask("99/99/9999");
		$("#FeeEndTime").mask("99:99 aa");



		$("#FeeInput td input,#FeeInput td select").keyup(function(e) { 
			if(e.keyCode == 13) {
				saveFee();
			}
		});
		
		<!--- ADD METHOD FOR FEES --->
		$("#SubmitFee").bind("click", this, function() {
			saveFee();
		});
			
		<!--- CANCEL EDIT OF FEE --->
		$(".CancelEdit").bind("click", this, function() {
			updateFees();
		});
		
		<!--- EDIT METHOD FOR FEE --->
		$(".EditFee").bind("click", this, function() {
			updateFees(this.id);
		});
		
		<!--- DELETED METHOD FOR FEE --->
		$(".DeleteFee").bind("click", this, function() {
			nId = this.id;
			
			if(confirm('Are you sure you would like to delete this fee?')) {
				$.blockUI( '<h1>Deleting Fee...</h1>' );
				
				$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", { method: "deleteFee", FeeID: nId, ActivityID: nActivity, returnFormat: "plain" },
				function(data) {
					if(data.STATUS) {
						$("#FeeRow" + nId).hide();
						updateFees();
					} else {
						addError(data.STATUSMSG,250,6000,4000);
					}
					
					$.unblockUI();
				});
			}
		});
	});
</script>
<style>
tr.FeeRow td { font-size:11px!important; }
</style>
<cfoutput>
<div class="ViewContainer">
<div class="ViewSection">
	<div class="ContentBody">
		<table width="100%" cellspacing="0" cellpadding="0" border="0" class="DataGrid">
			<thead>
				<tr>
					<th><a href="javascript:void(0);">Name</a></th>
					<th><a href="javascript:void(0);">Start Date/Time</a></th>
					<th><a href="javascript:void(0);">End Date/Time</a></th>
					<th><a href="javascript:void(0);">Amount</a></th>
					<th><a href="javascript:void(0);">&nbsp;</a></th>
				</tr>
			</thead>
            <tbody>
                <input type="hidden" name="FeeID" id="FeeID" value="#Attributes.FeeID#" />
                <tr id="FeeInput">
                    <td style="text-align:center;vertical-align:top;" nowrap="nowrap"><input type="text" name="Name" id="Name" tabindex="1" value="#Attributes.Name#"></td>
                    <td>
                        <input type="text" name="FeeStartDate" id="FeeStartDate" class="DatePicker" value="#Attributes.FeeStartDate#" tabindex="2"><br />
                        <input type="text" name="FeeStartTime" id="FeeStartTime" class="TimePicker" tabindex="3" value="#Attributes.FeeStartTime#"><label for="FeeStartTime"><img src="#Application.Settings.RootPath#/_images/icons/clock.png" name="StartTimeButton" id="StartTimeButton" /></label>
                    </td>
                    <td>
                        <input type="text" name="FeeEndDate" id="FeeEndDate" class="DatePicker" value="#Attributes.FeeEndDate#" tabindex="4"><br />
                        <input type="text" name="FeeEndTime" id="FeeEndTime" class="TimePicker" value="#Attributes.FeeEndTime#" tabindex="4"><label for="FeeEndTime"><img src="#Application.Settings.RootPath#/_images/icons/clock.png" name="EndTimeButton" id="EndTimeButton" /></label>
                    </td>
                    <td style="text-align:right;vertical-align:top;">$<input type="text" name="Amount" id="Amount" value="#Attributes.Amount#" tabindex="5" style="width:45px;text-align:right;"></td>
                    <td style="vertical-align:top;"><cfif isNumeric(Attributes.FeeID)><a href="javascript://" id="SubmitFee" class="SubmitFee">Save</a><br /><a href="javascript://" id="CancelEdit" class="CancelEdit">Cancel</a><cfelse><img src="#Application.Settings.RootPath#/_images/icons/add.png" id="SubmitFee" class="SubmitFee" /></cfif></td>
                </tr>
                <tr>
                    <td colspan="5"><strong>**Note: fees only apply during the time period for each given fee.**</strong></td>
                </tr>
				<cfloop query="qFinFeeList">
					<cfset Attributes.TotalAmount = Attributes.TotalAmount + qFinFeeList.Amount>
					<tr class="FeeRow" id="FeeRow#qFinFeeList.FeeID#">
						<td valign="top">#qFinFeeList.Name#</td>
						<td valign="top">#DateFormat(qFinFeeList.StartDate,"MM/DD/YYY")# at #TimeFormat(qFinFeeList.StartDate,"h:mmTT")#</td>
						<td valign="top">#DateFormat(qFinFeeList.EndDate,"MM/DD/YYY")# at #TimeFormat(qFinFeeList.EndDate,"h:mmTT")#</td>
						<td valign="top" style="text-align:right;">#LSCurrencyFormat(qFinFeeList.Amount)#</td>
						<td valign="top"><img src="#Application.Settings.RootPath#/_images/icons/pencil.png" class="EditFee" id="#qFinFeeList.FeeID#" style="cursor:pointer;" alt="Edit Fee" /><img src="#Application.Settings.RootPath#/_images/icons/bin.png" class="DeleteFee" id="#qFinFeeList.FeeID#" style="cursor:pointer;" alt="Delete Fee" /></td>
					</tr>
				</cfloop>
				<tr>
					<td colspan="2"><strong>Total Entries:</strong> #qFinFeeList.RecordCount#</td>
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