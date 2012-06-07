<cfparam name="Attributes.Supporter" default="">
<cfparam name="Attributes.SupportType" default="">
<cfparam name="Attributes.Amount" default="0">
<cfparam name="Attributes.ContractNum" default="">
<cfparam name="Attributes.BudgetRequested" default="">
<cfparam name="Attributes.BudgetDueDate" default="">
<cfparam name="Attributes.BudgetSent" default="">
<cfparam name="Attributes.DateSent" default="">
<cfparam name="Attributes.FundsReturned" default="">

<script>
<cfoutput>
var nActivity = #Attributes.ActivityID#;
var nSupport = #Attributes.SupportID#;
var nCurrSupporter = 0;
</cfoutput>
	
function updateSupporterLink() {
	if($("#Supporter").val() != '') {
		$("#NewSupporterLinkText").css("display","none");
		$("#EditSupporterLinkText").css("display","");
	} else {
		$("#NewSupporterLinkText").css("display","");
		$("#EditSupporterLinkText").css("display","none");
	}
}

$(document).ready(function() {
		updateSupporterLink();
		
		// EDIT SUPPORTER DIALOG
		$("#EditSupporterContainer").dialog({ 
			title: "Edit Supporter",
			modal: true, 
			autoOpen: false,
			resizable: false,
			height: 190,
			position: [25,25],
			open:function() {
				$("#EditSupporterContainer").show();
			},
			close:function() {
				$("#frmEditSupporter").attr("src","javascript://");
			},
			buttons: {
				Save:function() {
					$.blockUI({ message: "Updating Information..." });
					sNewSupporterName = window.frames.frmEditSupporter.document.getElementById("Name").value;
					window.frames.frmEditSupporter.document.formEditSupporter.submit();
					window.location = sMyself + "Activity.EditCurrSupport?ActivityID=" + nActivity + "&SupportID=" + nSupport;
				},
				Cancel:function() {
					$("#NewSupporterContainer").show();
					$("#EditSupporterContainer").dialog("close");
				}
			}
		});
		
		// OPEN DIALOG
		$(".EditSupporterLink").click(function() {
			$("#NewSupporterContainer").dialog("close");
											   
			nCurrSupporter = $("#Supporter").val();
			
			$("#frmEditSupporter").attr("src",sMyself + "Activity.EditSupporter?SupporterID=" + nCurrSupporter);
			$("#EditSupporterContainer").dialog("open");
		});
			
		// CHECK IF SUPPORTER VALUE IS BLANK OR NOT
		$("#Supporter").bind("change", this, function() {
			updateSupporterLink();
		});
			
	/* CREATE A SUPPORT DIALOG START */
		$("#NewSupporterContainer").dialog({
			title:"Create Supporter",
			modal:true,
			autoOpen: false,
			resizable: false,
			height: 170,
			position: [25,25],
			open:function() {
				$("#NewSupporterContainer").show();
			},
			buttons: {
				Save:function() {
					$("#frmNewSupporter").submit();
				},
				Cancel: function() {
					$("#NewSupporterContainer").dialog("close");
				}
			}
		});
	/* CREATE A SUPPORT DIALOG END */
		
	/* CREATE SUPPORTER DIALOG FUNCTIONS START */
		// OPEN DIALOG
		$(".NewSupporterLink").bind("click", this, function() {
			$("#NewSupporterContainer").dialog("open");
			$("#NewSupporterName").focus();
		});
	/* CREATE SUPPORTER DIALOG FUNCTIONS END */
			
	/* AJAX FORM START */
		var NewSupporterOptions = { 
			target:        '',   // target element(s) to be updated with server response 
			beforeSubmit:  showRequest,  // pre-submit callback 
			success:       showResponse,  // post-submit callback 
		
			// other available options: 
			url:       sRootPath + '/_com/AJAX_System.cfc',         // override for form's 'action' attribute 
			type:      'get'        // 'get' or 'post', override for form's 'method' attribute 
			//dataType:  null        // 'xml', 'script', or 'json' (expected server response type) 
			//clearForm: true        // clear all form fields after successful submit 
			//resetForm: true        // reset the form after successful submit 
		
			// $.ajax options can be used here too, for example: 
			//timeout:   3000 
		}; 
			
	/* AJAX FORM START */
		var EditSupportOptions = { 
			target:        '',   // target element(s) to be updated with server response 
			beforeSubmit:  showRequest,  // pre-submit callback 
			success:       showResponse,  // post-submit callback 
		
			// other available options: 
			url:       sRootPath + '/_com/AJAX_Activity.cfc',         // override for form's 'action' attribute 
			type:      'get'        // 'get' or 'post', override for form's 'method' attribute 
			//dataType:  null        // 'xml', 'script', or 'json' (expected server response type) 
			//clearForm: true        // clear all form fields after successful submit 
			//resetForm: true        // reset the form after successful submit 
		
			// $.ajax options can be used here too, for example: 
			//timeout:   3000 
		}; 
		
		// bind to the form's submit event | CREATE SUPPORTER
		$('#frmNewSupporter').submit(function() { 
			// inside event callbacks 'this' is the DOM element so we first 
			// wrap it in a jQuery object and then invoke ajaxSubmit 
			$.blockUI({ message: "<h2>Saving information...</h2>" });
			$(this).ajaxSubmit(NewSupporterOptions); 
		
			// !!! Important !!! 
			// always return false to prevent standard browser submit and page navigation 
			return false; 
		});
		
		// bind to the form's submit event | CREATE SUPPORTER
		$('#formEditCurrSupport').submit(function() { 
			// inside event callbacks 'this' is the DOM element so we first 
			// wrap it in a jQuery object and then invoke ajaxSubmit 
			alert("hello again");
			return false;
			$.blockUI({ message: "<h2>Saving information...</h2>" });
			$(this).ajaxSubmit(EditSupportOptions); 
		
			// !!! Important !!! 
			// always return false to prevent standard browser submit and page navigation 
			return false; 
		});
	/* AJAX FORM END */
});

// pre-submit callback 
function showRequest(formData, jqForm, options) { 
	// formData is an array; here we use $.param to convert it to a string to display it 
	// but the form plugin does this for you automatically when it submits the data 
	var queryString = $.param(formData); 
 
	// jqForm is a jQuery object encapsulating the form element.  To access the 
	// DOM element for the form do this: 
	// var formElement = jqForm[0];  
 
	// here we could return false to prevent the form from being submitted; 
	// returning anything other than false will allow the form submit to continue 
	return true; 
} 
 
// post-submit callback 
function showResponse(responseText, statusText)  { 
	// for normal html responses, the first argument to the success callback 
	// is the XMLHttpRequest object's responseText property 
 
	// if the ajaxSubmit method was passed an Options Object with the dataType 
	// property set to 'xml' then the first argument to the success callback 
	// is the XMLHttpRequest object's responseXML property 
 
	// if the ajaxSubmit method was passed an Options Object with the dataType 
	// property set to 'json' then the first argument to the success callback 
	// is the json data object returned by the server 
	
	cleanData = $.trim(responseText);
	status = $.ListGetAt(cleanData,1,"|");
	statusMsg = $.ListGetAt(cleanData,2,"|");
	alert(cleanData);
	if(status == "Success") {
		NewSupportID = $.ListGetAt(cleanData,3,"|"); 							// Define variable for new supporter
		$("#Supporter").addOption(NewSupportID, $("#NewSupporterName").val());	// Add new option to the Supporter Select List
		$("#Supporter").sortOptions();											// Sort the options for the Supporter Select List
		$("#Supporter").val(NewSupportID);										// Set the value of the Supporter Select list to the value of the new supporter
		addMessage(statusMsg,250,2500,2500);
		CloseNewSupporterForm();
	} else if(status == "SupportSuccess") {
		window.parent.$("#EditSupportRecord").dialog("close");
	} else if(status == "Exists") {
		SupportID = $.ListGetAt(cleanData,3,"|"); 
		$("#Supporter").val(SupportID);	
		CloseNewSupporterForm();
		addError(statusMsg,250,2500,2500);
	} else if(status == "SupportFail") {
		$.unblockUI();
		addError(statusMsg,250,2500,2500);
	} else {
		CloseNewSupporterForm();
		addError(statusMsg,250,2500,2500);
		$.unblockUI();
	}
}
	
function CloseNewSupporterForm() {
	$("#NewSupporterContainer").dialog("close");
	$("#NewSupporterName").val("");
	$("#NewSupporterDescrip").val("");
	$.unblockUI();
}
</script>
<cfoutput>
<div id="EditSupporterContainer" style="display:none;">
	<iframe src="" name="frmEditSupporter" id="frmEditSupporter" frameborder="0" width="100%" height="100%" scrolling="no"></iframe>
</div>
<div id="EditSupportRecord">
	<form name="formEditCurrSupport" id="formEditCurrSupport" method="post">
    <input type="hidden" name="Method" value="saveSupport" />
    <input type="hidden" name="ActivityID" value="#Attributes.ActivityID#" />
    <input type="hidden" name="SupportID" value="#Attributes.SupportID#" />
    <input type="hidden" name="Submitted" value="1" />
	<table>
		<tr id="SupportInput">
			<td>Supporter</td>
			<td>
				<select name="Supporter" id="Supporter" style="width:355px;">
					<option value="">Select one...</option>
					<cfloop query="qSupporterList">
						<option value="#qSupporterList.ContributorID#"<cfif Attributes.Supporter EQ qSupporterList.ContributorID> SELECTED</cfif>>#qSupporterList.Name#</option>
					</cfloop>
				</select>
				 <span id="NewSupporterLinkText"><a href="javascript:void(0);" class="NewSupporterLink">Create Supporter</a></span>
				 <span id="EditSupporterLinkText" style="display:none;"><a href="javascript:void(0);" class="EditSupporterLink">Edit Supporter</a></span>
			</td>
		</tr>
		<tr>
			<td>Support Type</td>
			<td>
				<select name="SupportType" id="SupportType">
					<option value="">Select one...</option>
					<cfloop query="qSupportTypeList">
						<option value="#qSupportTypeList.ContribTypeID#"<cfif Attributes.SupportType EQ qSupportTypeList.ContribTypeID> SELECTED</cfif>>#qSupportTypeList.Name#</option>
					</cfloop>
				</select>
			</td>
		</tr>
		<tr>
			<td>Amount</td>
			<td><input type="text" name="Amount" id="Amount" value="#Attributes.Amount#" /></td>
		</tr>
		<tr>
			<td>Contract ##</td>
			<td><input type="text" name="ContractNum" id="ContractNum" value="#Attributes.ContractNum#" /></td>
		</tr>
		<tr>
			<td>Budget requested</td>
			<td><input type="radio" name="BudgetRequested" class="BudgetRequested" value="Y"<cfif Attributes.BudgetRequested EQ 'Y'> CHECKED</cfif> /> Yes <input type="radio" name="BudgetRequested" class="BudgetRequested" value="N"<cfif Attributes.BudgetRequested EQ 'N'> CHECKED</cfif> /> No</td>
		</tr>
		<tr>
			<td>Due day of budget</td>
			<td><input type="text" name="BudgetDueDate" id="date1" value="#Attributes.BudgetDueDate#" /></td>
		</tr>
		<tr>
			<td>Budget sent</td>
			<td><input type="text" name="BudgetSent" id="date2" value="#Attributes.BudgetSent#" /></td>
		</tr>
		<tr>
			<td>Date sent</td>
			<td><input type="text" name="DateSent" id="date3" value="#Attributes.DateSent#" /></td>
		</tr>
		<tr>
			<td>Funds returned</td>
			<td><input type="text" name="FundsReturned" id="FundsReturned" value="#Attributes.FundsReturned#" /></td>
		</tr>
	</table>
	</form>
</div>
<div id="NewSupporterContainer" style="display:none;">
	<form id="frmNewSupporter" method="post">
		<input type="hidden" value="#Attributes.ActivityID#" name="ActivityID">
		<input type="hidden" value="saveSupporter" name="method">
		<input type="hidden" value="Plain" name="ReturnFormat">
		<table>
			<tr>
				<td>Name</td>
				<td><input type="text" name="NewSupporterName" id="NewSupporterName"></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><textarea name="NewSupporterDescrip" id="NewSupporterDescrip"></textarea></td>
			</tr>
		</table>
	</form>
</div>
</cfoutput>