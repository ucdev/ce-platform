<script>
	function updateCommittee() {
		$("#CommitteeLoading").show();
		$.post(sMyself + "Activity.CommitteeAHAH", { ActivityID: nActivity }, function(data) {
			$("#CommitteeContainer").html(data);
			$("#CommitteeLoading").hide();
		});
	}
	
	function saveCommitteeMember() {
		$.blockUI({ message: '<h1>Adding Committee Member...</h1>'});
		$.post(sRootPath + "/_com/AJAX_Activity.cfc", { method: "saveCommitteeMember", PersonID: $("#CommitteeID").val(), ActivityID: nActivity, returnFormat: "plain" },
			function(returnData) {
				cleanData = $.trim(returnData);
				status = $.ListGetAt(cleanData,1,"|");
				statusMsg = $.ListGetAt(cleanData,2,"|");
				
				if(status == 'Success') {
					updateCommittee();
					addMessage(statusMsg,250,6000,4000);
					$.unblockUI();
				} else if(status == 'Fail') {
					addError(statusMsg,250,6000,4000);
					$("#FacultyName").val("Click Here to Search");
				}
			});
		
		$("#PersonActivityID").val('');
		$("#PersonActivityName").val('Click Here To Lookup');
	}
	
	$(document).ready(function() {
		updateCommittee();
		
		/* CHANGE COMMITTEE ROLE START */
		$("#btnRoleSubmit").click(function() {
			$.blockUI({ message: "<h1>Updating information...</h1>" });
			var nActivityRole = $("#ActivityRoles").val();
			var result = '';
			
			$(".MemberCheckbox:checked").each(function () {
				result = $.ListAppend(result,$(this).val(),",");
			});
			
			$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", { method: "ChangeCommitteeRoles", PersonList: result, ActivityID: nActivity, RoleID:$("#RoleID").val(), returnFormat: "plain" },
				function(data) {
					if(data.STATUS) {
						updateCommittee();
						addMessage(data.STATUSMSG,250,6000,4000);
						$.unblockUI();
					} else {
						updateCommittee();
						addError(data.STATUSMSG,250,6000,4000);
						$.unblockUI();
					}
			});
		});
		/* CHANGE COMMITTEE ROLE END */
		
		$('#CommitteeList').ajaxForm();
		
		/* REMOVE ONLY CHECKED */
		$("#RemoveChecked").bind("click",function() {
			if(confirm("Are you sure you want to remove the checked people from this Activity?")) {
				var result = "";
				var cleanData = "";
				$(".MemberCheckbox:checked").each(function () {
					result = $.ListAppend(result,$(this).val(),",");
				});				
				
				$.blockUI({ message: '<h1>Removing Selected Committee Members...</h1>'});
				$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", { method: "removeCheckedCommittee", PersonList: result, ActivityID: nActivity, returnFormat: "plain" },
					function(data) {
						if(data.STATUS) {
							addMessage(data.STATUSMSG,250,6000,4000);
						} else {
							addError(data.STATUSMSG,250,6000,4000);
						}
						
						updateCommittee();
						updateAll();
						$.unblockUI();
				});
			}
		});
		
		/* REMOVE ALL PEOPLE FROM Activity */
		$("#RemoveAll").bind("click",function() {
			if(confirm("WARNING!\nYou are about to remove ALL people from this Activity!\nAre you sure you wish to continue?")) {
				var cleanData = "";

				$.blockUI({ message: '<h1>Removing All Committee Members...</h1>'});
				$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", { method: "removeAllCommittee", ActivityID: nActivity, returnFormat: "plain" },
					function(data) {
						if(data.STATUS) {
							updateCommittee();
							addMessage(data.STATUSMSG,250,6000,4000);
						} else {
							addError(data.STATUSMSG,250,6000,4000);
						}
						
						updateAll();
						$.unblockUI();
				});
			}
		});
	});
	
</script>
<cfoutput>
<div class="ViewSection">
	<h3>Committee Members</h3>
	<div id="CommitteeContainer"></div>
	<div id="CommitteeLoading" class="Loading"><img src="/admin/_images/ajax-loader.gif" />
	<div>Please Wait</div></div>
</div>
</cfoutput>