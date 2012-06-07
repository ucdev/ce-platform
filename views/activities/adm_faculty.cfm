<cfoutput>
<h4>Faculty</h4>
<script>
	var CurrPersonID = 0;
	
	function saveFacultyMember() {
		$.blockUI({ message: '<h1>Adding Faculty Member...</h1>'});
		$.post(sRootPath + "/_com/AJAX_Activity.cfc", { method: "saveFacultyMember", PersonID: $("#FacultyID").val(), ActivityID: nActivity, returnFormat: "plain" },
			function(returnData) {
				cleanData = $.trim(returnData);
				status = $.ListGetAt(cleanData,1,"|");
				statusMsg = $.ListGetAt(cleanData,2,"|");

				if(status == 'Success') {
					updateFaculty();
					updateActions();
					addMessage(statusMsg,250,6000,4000);
					$.unblockUI();
				} else if(status == 'Fail') {
					addError(statusMsg,250,6000,4000);
					$.unblockUI();
					$("#FacultyName").val("Click Here to Search");
				}
			});
		
		$("#PersonActivityID").val('');
		$("#PersonActivityName").val('Click Here To Search');
	}
	
	function updateFaculty() {
		$("#FacultyLoading").show();
		$.post(sMyself + "Activity.FacultyAHAH", { ActivityID: nActivity }, function(data) {
			$("#FacultyContainer").html(data);
			$("#FacultyLoading").hide();
		});
	};
	
	$(document).ready(function() {
		updateFaculty();
		
		$('#FacultyList').ajaxForm();
		
		/* REMOVE ONLY CHECKED */
		$("#RemoveChecked").bind("click",function() {
			if(confirm("Are you sure you want to remove the checked people from this Activity?")) {
				var result = "";
				var cleanData = "";
				$(".MemberCheckbox:checked").each(function () {
					result = $.ListAppend(result,$(this).val(),",");
				});
				
				$.blockUI({ message: '<h1>Removing Selected Faculty Members...</h1>'});
				$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", { method: "removeCheckedFaculty", PersonList: result, ActivityID: nActivity, returnFormat: "plain" },
				function(data) {
					if(data.STATUS) {
						addMessage(data.STATUSMSG,250,6000,4000);
					} else {
						addError(data.STATUSMSG,250,6000,4000);
					}
					
					updateFaculty();
					updateActions();
					$.unblockUI();	
				});
			}
		});
		
		/* REMOVE ALL PEOPLE FROM Activity */
		$("#RemoveAll").bind("click",function() {
			if(confirm("WARNING!\nYou are about to remove ALL people from this Activity!\nAre you sure you wish to continue?")) {
				var cleanData = "";
				
				$.blockUI({ message: '<h1>Removing All Faculty Members...</h1>'});
				$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", { method: "removeAllFaculty", ActivityID: nActivity, returnFormat: "plain" },
				function(data) {
					if(data.STATUS) {
						addMessage(data.STATUSMSG,250,6000,4000);
					} else {
						addError(data.STATUSMSG,250,6000,4000);
					}
					
					updateFaculty();
					updateActions();
					$.unblockUI();
				});
			}
		});
	
		/* CHANGE FACULTY ROLE START */
		$("#btnRoleSubmit").bind("click",function() {
			var result = "";
			var nActivityRole = $("#ActivityRoles").val();
			
			$.blockUI({ message: "<h1>Updating information...</h1>" });
			
			$(".MemberCheckbox:checked").each(function () {
				result = $.ListAppend(result,$(this).val(),",");
			});
			
			$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", { method: "changeFacultyRoles", PersonList: result, ActivityID: nActivity, RoleID:$("#RoleID").val(), returnFormat: "plain" },
			function(data) {
				if(data.STATUS) {
					addMessage(data.STATUSMSG,250,6000,4000);
					$.unblockUI();
					updateFaculty();
				} else {
					addError(data.STATUSMSG,250,6000,4000);
					$.unblockUI();
				}
			});
		});
		/* CHANGE FACULTY ROLE END */
	});
</script>
<cfoutput>
<div id="FacultyContainer"></div>
<div id="FacultyLoading" class="Loading"><img src="/admin/_images/ajax-loader.gif" />
<div>Please Wait</div></div>
<div id="FileUploader">
</div>
</cfoutput>
</cfoutput>