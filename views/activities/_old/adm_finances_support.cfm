<cfparam name="Attributes.Supporter" default="">
<cfparam name="Attributes.SupportType" default="">
<cfparam name="Attributes.Amount" default="0">
<cfparam name="Attributes.TotalAmount" default="0">
<cfparam name="Attributes.ContractNum" default="">
<cfparam name="Attributes.BudgetRequested" default="">
<cfparam name="Attributes.BudgetDueDate" default="">
<cfparam name="Attributes.BudgetSent" default="">
<cfparam name="Attributes.DateSent" default="">
<cfparam name="Attributes.FundsReturned" default="">
<script>
	<cfoutput>
	var nId = 0;
	var nTotalSupportCount = #qActivitySupportersList.RecordCount#;
	var nCurrSupporter = 0;
	
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
	
	function updateSupporters() {
		$("#BudgetLoading").show();
		
		$.post(sMyself + "Activity.FinSupportAHAH", { ActivityID: nActivity }, 
			function(data) {
				$("#SupportContainer").html(data);
				$("#SupportLoading").hide();
		});
	}
	
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
		/* FORM VARIABLE UNBINDING START */
			$("#NewSupporterClose").unbind();
			$("#SupporterDialog").unbind();
			$("#Supporter").unbind();
			$("#SupportType").unbind();
			$("#Amount").unbind();
			$("#ContractNum").unbind();
			$(".BudgetRequested").unbind();
			$("#FundsReturned").unbind();
		/* FORM VARIABLE UNBINDING END */
		
		/* KEY BINDINGS START */
			$("#SupportInput td input,#SupportInput td select").keyup(function(e) { 
				if(e.keyCode == 13) {
					SubmitForm(document.frmSupport);
				}
			});
		/* KEY BINDINGS END */
		
		/* ON LOAD METHODS START */
			updateSupporters();
			
			// ADD SUPPORTER DIALOG: CHECK IF SUPPORTER VALUE IS BLANK OR NOT
			updateSupporterLink();
		/* ON LOAD METHODS END */
		
		/* DIALOG BOXES START */
			// ADD SUPPORTER DIALOG
			$("#NewSupportRecord").dialog({ 
				title:"Add Supporter",
				modal: true, 
				autoOpen: false,
				resizable: false,
				height:370,
				width:475,
				position: [100,100],
				overlay: { 
					opacity: 0.5, 
					background: "black" 
				},
				open:function() {
					$("#NewSupportRecord").show();
				},
				close:function() {
					$("#NewSupportRecord").hide();
				},
				buttons: { 
					Continue:function() {
						$("#frmSupport").submit();
					}, 
					Cancel:function() {
						$(this).dialog("close");
					}
				}
			});
			
			// CREATE A SUPPORT DIALOG
			$("#NewSupporterContainer").dialog({
				title:"Create Supporter",
				modal:false,
				autoOpen: false,
				resizable: false,
				height: 190,
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
			
			// EDIT SUPPORTER DIALOG
			$("#EditSupporterContainer").dialog({ 
				title: "Edit Supporter",
				modal: true, 
				autoOpen: false,
				resizable: false,
				height: 190,
				open:function() {
					$("#EditSupporterContainer").show();
				},
				close:function() {
					$("#frmEditSupporter").attr("src","javascript://");
				},
				buttons: {
					Save:function() {
						sNewSupporterName = window.frames.frmEditSupporter.document.getElementById("Name").value;
						window.frames.frmEditSupporter.document.formEditSupporter.submit();
						
						$("#EditSupporterContainer").dialog("close");
						
						$("#Supporter").removeOption(nCurrSupporter);
						$("#Supporter").addOption(nCurrSupporter, sNewSupporterName);
						$("#Supporter").sortOptions();
					},
					Cancel:function() {
					$("#NewSupporterContainer").show();
						$("#EditSupporterContainer").dialog("close");
					}
				}
			});
		/* DIALOG BOXES END */
		
		/* ADD SUPPORTER DIALOG FUNCTIONS START */
			// OPEN DIALOG
			$("#SupporterDialog").bind("click", function() {
				$("#NewSupportRecord").dialog("open");
			});
			
			// CHECK IF SUPPORTER VALUE IS BLANK OR NOT
			$("#Supporter").bind("change", this, function() {
				updateSupporterLink();
			});
		/* ADD SUPPORTER DIALOG FUNCTIONS END */
		
		/* CREATE SUPPORTER DIALOG FUNCTIONS START */
			// OPEN DIALOG
			$(".NewSupporterLink").bind("click", this, function() {
				$("#NewSupporterContainer").dialog("open");
				$("#NewSupporterName").focus();
			});
		/* CREATE SUPPORTER DIALOG FUNCTIONS END */
		
		/* EDIT SUPPORTER DIALOG FUNCTIONS START */
			// OPEN DIALOG
			$(".EditSupporterLink").click(function() {
				$("#NewSupporterContainer").dialog("close");
												   
				var nSupporterID = $("#Supporter").val();
				var sSupporterName = $("#Supporter option[value=" + nSupporterID + "]").text();
				
				$("#original_name").val(sSupporterName);
				$("#NewSupporterName").val(sSupporterName);
				$("#NewSupporterContainer").dialog("open");
			});
		/* EDIT SUPPORTER DIALOG FUNCTIONS END */
		
		/* AJAX FORM START // FOR ADDING A NEW SUPPORT RECORD */
		var SupportOptions = { 
	        target:        '',   // target element(s) to be updated with server response 
	        beforeSubmit:  showRequest,  // pre-submit callback 
	        success:       showResponse,  // post-submit callback 
	 
	        // other available options: 
	        url:       sRootPath + '/_com/AJAX_Activity.cfc',         // override for form's 'action' attribute 
	        type:      'post'        // 'get' or 'post', override for form's 'method' attribute 
	        //dataType:  null        // 'xml', 'script', or 'json' (expected server response type) 
	        //clearForm: true        // clear all form fields after successful submit 
	        //resetForm: true        // reset the form after successful submit 
	 
	        // $.ajax options can be used here too, for example: 
	        //timeout:   3000 
	    }; 
		
		/* AJAX FORM START // FOR ADDING A NEW SUPPORTER */
		var SupporterOptions = { 
	        target:        '',   // target element(s) to be updated with server response 
	        beforeSubmit:  showRequest,  // pre-submit callback 
	        success:       showResponse,  // post-submit callback 
	 
	        // other available options: 
	        url:       sRootPath + '/_com/AJAX_System.cfc',         // override for form's 'action' attribute 
	        type:      'post'        // 'get' or 'post', override for form's 'method' attribute 
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
	        $(this).ajaxSubmit(SupporterOptions); 
	 
	        // !!! Important !!! 
	        // always return false to prevent standard browser submit and page navigation 
	        return false; 
	    });
	 
	    // bind to the form's submit event | ADD SUPPORTER
	    $('#frmSupport').submit(function() { 
	        // inside event callbacks 'this' is the DOM element so we first 
	        // wrap it in a jQuery object and then invoke ajaxSubmit 
	        $(this).ajaxSubmit(SupportOptions); 
	 
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
	    
		var data = $.parseJSON(responseText);
		
		if($.ArrayLen(data.DATASET) > 0) {
			if(data.STATUS) {
				NewSupportID = data.DATASET[0].SUPPORTERID; 							// Define variable for new supporter
				$("#Supporter").addOption(NewSupportID, $("#NewSupporterName").val());	// Add new option to the Supporter Select List
				$("#Supporter").sortOptions();											// Sort the options for the Supporter Select List
				$("#Supporter").val(NewSupportID);										// Set the value of the Supporter Select list to the value of the new supporter
				addMessage(data.STATUSMSG,250,2500,2500);
				CloseNewSupporterForm();
			} else {
				SupportID = data.DATASET[0].SUPPORTERID;
				$("#Supporter").val(SupportID);	
				CloseNewSupporterForm();
				addError(data.STATUSMSG,250,2500,2500);
			}
		} else {
			if(data.STATUS) {
				updateSupporters();
				$("#NewSupportRecord").dialog("close");
			} else {
				CloseNewSupporterForm();
				addError(data.STATUSMSG,250,2500,2500);
			}
		}
	}
	
	function CloseNewSupporterForm() {
		$("#NewSupporterContainer").dialog("close");
		$("#NewSupporterName").val("");
		$("#NewSupporterDescrip").val("");
	}
</script>
<cfoutput>
<style>
tr.SupportRow td { font-size:11px!important; }
</style>

<div class="ViewSection">
	<h3>Supporters</h3>
	<div id="SupportContainer"></div>
	<div id="SupportLoading" class="Loading"><img src="/admin/_images/ajax-loader.gif" />
	<div>Please Wait</div>
	</div>
</div>
<div id="NewSupporterContainer" style="display:none;">
	<form id="frmNewSupporter" method="post">
		<input type="hidden" value="#Attributes.ActivityID#" name="ActivityID">
		<input type="hidden" value="saveSupporter" name="method">
		<input type="hidden" value="Plain" name="ReturnFormat">
		<input type="hidden" value="" name="original_name" id="original_name">
		<table>
			<tr>
				<td>Name</td>
				<td><textarea name="NewSupporterName" id="NewSupporterName" style="height:90px; width:230px;"></textarea></td>
			</tr>
			<tr style="display: none;">
				<td>Description</td>
				<td><textarea name="NewSupporterDescrip" id="NewSupporterDescrip"></textarea></td>
			</tr>
		</table>
	</form>
</div>
<div id="NewSupportRecord" style="display:none;">
	<form id="frmSupport" method="post">
		<input type="hidden" value="#Attributes.ActivityID#" name="ActivityID">
		<input type="hidden" value="saveSupport" name="method">
		<input type="hidden" value="Plain" name="ReturnFormat">
	<table>
		<tr id="SupportInput">
			<td>Supporter</td>
			<td>
				<select name="Supporter" id="Supporter" style="width:350px;">
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
</cfoutput>