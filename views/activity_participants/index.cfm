<cfoutput>
<!--<h4>Participants</h4>-->
<div class="btn-toolbar">
	<div class="btn-group pull-left">
		<a href="##" class="btn"><i class="icon-plus-sign"></i> Add</a>
		<a href="##" class="btn"><i class="icon-hdd"></i> Import</a>
	</div>
	<div class="btn-group pull-left">
		<a class="btn dropdown-toggle" data-toggle="dropdown" href="##">
		Actions
		<span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="##">Remove</a></li>
			<li><a href="##">Change Statuses</a></li>
			<li class="divider"></li>
			<li><a href="##">CME Certificates</a></li>
			<li><a href="##">Nurse Certificates</a></li>
		</ul>
	</div>
	<div class="btn-group pull-right">
		<button class="btn" data-toggle="dropdown">Filter By:</button>
		<button class="btn attendee-status-title" data-toggle="dropdown">All</button>
		<button class="btn dropdown-toggle" data-toggle="dropdown">
			<span class="caret"></span>
		</button>
		<ul class="dropdown-menu attendees-filter">
			<li class="attendee-status" id="status0"><a href="##"> All <span></span></a></li>
			<li class="divider"></li>
			<li class="attendee-status" id="status1"><a href="##">Complete <span></span></a></li>
			<li class="attendee-status" id="status4"><a href="##">Failed <span></span></a></li>
			<li class="attendee-status" id="status2"><a href="##">In Progress <span></span></a></li>
			<li class="attendee-status" id="status3"><a href="##">Registered <span></span></a></li>
		</ul>
	</div>
</div>
</cfoutput>
<cfparam name="params.Page" type="numeric" default="1" />

<script>
	<cfoutput>
	var nActivity = #params.key#;
	var nId = #params.Page#;
	var nStatus = #params.status#;
	var SelectedMembers = '';
	var SelectedAttendees = '';
	var SelectedCount = 0;
	var TotalAttendeeCount;
	var TotalAttendeeList;
	</cfoutput>
	
	function updateRegistrants(nPage, nStatus) {
		$("#RegistrantsLoading").show();
		$.ajax({
			url: '/activity_participants/ahah', 
			type: 'get',
			data: { activityId: nActivity, status: nStatus, page: nPage },
			success: function(data) {
				$("#RegistrantsContainer").html(data);
				$("#RegistrantsLoading").hide();
				
				$(".AllAttendees").unbind();
				$(".AllAttendees").isPerson();
				
				// PLACE CHECKMARK BY ACTIVE STATUS
				$('.active-status').remove();
				$('#status' + nStatus).find('a').prepend('<i class="icon-ok active-status"></i> ');
				
				// REPLACE ACTIVE STATUS TITLE
				$('.attendee-status-title').text($('#status' + nStatus).find('a').text());
				
				// CHECK IF ATTENDEE HAS BEEN MARKED AS SELECTED	
				$(".AllAttendees").each(function() {
					$row = $(this);
					var $checkBox = $row.find('.MemberCheckbox');
					var nPerson = $row.find('.personId').val();
					var nAttendee = $row.find('.attendeeId').val();
			
					$checkBox.click(function() {
						if($(this).attr("checked")) {
							$("#attendeeRow-" + nAttendee).css("background-color","#FFD");
							
							// ADD CURRENT MEMBER TO SELECTEDMEMBERS LIST
							addSelectedAttendee({
								person:nPerson,
								attendee:nAttendee
							});
						} else {
							$("#attendeeRow-" + nAttendee).css("background-color","#FFF");
							
							// REMOVE CURRENT MEMBER FROM SELECTEDMEMBERS LIST
							removeSelectedPerson({
								person:nPerson,
								attendee:nAttendee
							});
						}
					});
					/*checkmarkMember({
						person:nPerson,
						attendee:nAttendee
					});*/
				});
			}
		});
	}
	
	function clearSelectedMembers() {
		SelectedAttendees = '';
		SelectedMembers = '';
		SelectedCount = 0;
		$("#CheckedCount").html("(0)");
	}
	
	function updateSelectedCount(nAmount) {
		SelectedCount = SelectedCount + nAmount;
		$("#CheckedCount").html("(" + SelectedCount + ")");
	}
	
	function addSelectedAttendee(params) {
		var settings = $.extend({},params);
		
		if(settings.person && settings.person > 0) {
			if(!$.ListFind(SelectedMembers,settings.person,",")) {
			SelectedMembers = $.ListAppend(SelectedMembers, settings.person, ",");
			}
		}
		
		if(settings.attendee && settings.attendee > 0) {
			if(!$.ListFind(SelectedAttendees,settings.attendee,",")) {
			SelectedAttendees = $.ListAppend(SelectedAttendees, settings.attendee, ",");
			}
		}
		
		updateSelectedCount(1);
	}
	
	function removeSelectedPerson(params) {
		var settings = $.extend({},params);
		
		if(settings.person && settings.person > 0) {
			SelectedMembers = $.ListDeleteAt(SelectedMembers, $.ListFind(SelectedMembers, settings.person));
		}
		
		if(settings.attendee && settings.attendee > 0) {
			SelectedAttendees = $.ListDeleteAt(SelectedAttendees, $.ListFind(SelectedAttendees, settings.attendee));
		}
		
		
		updateSelectedCount(-1);
	}
	
	function saveAttendee() {
		$.blockUI({ message: '<h1>Adding Attendee...</h1>'});
		
		$.post("/AJAX_adm_Activity/saveAttendee", { PersonID: $("#AttendeeID").val(), ActivityID: nActivity, returnFormat: "plain" },
			function(returnData) {
				cleanData = $.trim(returnData);
				status = $.ListGetAt(cleanData,1,"|");
				statusMsg = $.ListGetAt(cleanData,2,"|");
				
				if(status == 'Success') {
					updateRegistrants(nId, nStatus);
					addMessage(statusMsg,250,6000,4000);
					$.unblockUI();
				} else if(status == 'Fail') {
					addError(statusMsg,250,6000,4000);
					$.unblockUI();
					$("#AttendeeName").val("Click To Add Attendee");
				}
			});
		
		$("#AttendeeID").val('');
		$("#AttendeeName").val('Click To Add Attendee');
	}
	
	$(document).ready(function() {
		<cfif structKeyExists(cookie, "user_attendee_page") AND GetToken(Cookie.USER_AttendeePage,1,"|") EQ params.ActivityID>
			<cfif getToken(cookie.user_attendeeStatus, 1, "|") EQ params.ActivityId>
				updateRegistrants(<cfoutput>#getToken(Cookie.USER_AttendeePage,2,"|")#, #getToken(Cookie.USER_AttendeeStatus,2,"|")#</cfoutput>);
			<cfelse>
				updateRegistrants(<cfoutput>#getToken(Cookie.USER_AttendeePage,2,"|")#</cfoutput>, nStatus);
			</cfif>
		<cfelse>
			updateRegistrants(nId, nStatus);
		</cfif>
		var MaxRegistrants = $("#MaxRegistrants").val();
		var AddlAttendees = $("#AddlAttendees").val();
		var NoChange = 0;
		
		$("a.page,a.first,a.last,a.next,a.previous").live("click",function() {
			nPageNo = $.Mid(this.href,$.Find('page=',this.href)+5,$.Len(this.href)-$.Find('page=',this.href)+4);
			$.post("/UserSettings/setAttendeePage", { ActivityID: nActivity, Page: nPageNo });
			updateRegistrants(nPageNo, nStatus);
			return false;
		});
		
		$(".attendees-filter li.attendee-status").live("click",function() {
			nStatus = this.id.split('status')[1];
			var statusLink = $(this).find('a');
			var countContainer = $(this).find('span');
			
			$("#RegistrantsContainer").html("");
			$("#RegistrantsLoading").show();
			$.post("/UserSettings/setAttendeeStatus", { ActivityID: nActivity, status: nStatus },
				function(data) {
					updateRegistrants(1, nStatus);
			});
			return false;
		});
		
		/* CHANGE ATTENDEE STATAUS START */
		$("#btnStatusSubmit").bind("click",function() {
			$.blockUI({ message: "<h1>Updating information...</h1>" });
			var result = "";
			var cleanData = "";
			
			var nActivityRole = $("#ActivityRoles").val();
			$(".MemberCheckbox:checked").each(function () {
				result = $.ListAppend(result,$(this).val(),",");
			});
			
			$.ajax({
				url: "/_com/AJAX_adm_Activity/updateAttendeeStatuses",
				type: 'post',
				data: { AttendeeList: result, ActivityID: nActivity, StatusID:$("#StatusID").val(), returnFormat: "plain" },
				dataType: 'json',
				success: function(returnData)  {
					status = returnData.STATUS;
					statusMsg = returnData.STATUSMSG;
					
					if(status) {
						addMessage(statusMsg,250,6000,4000);
						$.unblockUI();
						updateStats();
						clearSelectedMembers();
						updateRegistrants(nId, nStatus);
					} else {
						addError(statusMsg,250,6000,4000);
						$.unblockUI();
					}
				}
			});
		});
		/* CHANGE ATTENDEE STATAUS END */
		
		/* REGISTRANTS AND ATTENDEE TEXTBOX START */
		$("#MaxRegistrants,#AddlAttendees").bind("blur", function() {
			if(MaxRegistrants != $("#MaxRegistrants").val()) {		// CHECK IF THE VALUE OF MAXREGISTRANTS CHANGED
				$.post("/AJAX_adm_Activity/updateMaxRegistrants",	{ ActivityID: nActivity, MaxRegistrants: $("#MaxRegistrants").val(), returnFormat: "plain" },
					function(returnData) {
						cleanData = $.trim(returnData);
						status = $.ListGetAt(cleanData,1,"|");
						statusMsg = $.ListGetAt(cleanData,2,"|");
						
						if(status == 'Success') {
							addMessage(statusMsg,250,6000,4000);
						} else {
							addError(statusMsg,250,6000,4000);
						}
					});
				
				MaxRegistrants = $("#MaxRegistrants").val();	// UPDATE MAXREGISTRANTS VALUE
			} else {
				NoChange = NoChange + 1;
			};
			
			if(AddlAttendees != $("#AddlAttendees").val()) {		// CHECK IF THE VALUE OF ADDLATTENDEES CHANGED
				$.post("/AJAX_adm_Activity/updateAddlAttendees", { ActivityID: nActivity, AddlAttendees: $("#AddlAttendees").val(), returnFormat: "plain" },
					function(returnData) {
						cleanData = $.trim(returnData);
						status = $.ListGetAt(cleanData,1,"|");
						statusMsg = $.ListGetAt(cleanData,2,"|");
						
						if(status == 'Success') {
							addMessage(statusMsg,250,6000,4000);
						} else {
							addError(statusMsg,250,6000,4000);
						}
					});
				
				AddlAttendees = $("#AddlAttendees").val();	// UPDATE ADDLATTENDEES VALUE
			} else {
				NoChange = NoChange + 1;
			};
			
			if(NoChange == 2) {
				addError("Please adjust the value you want to update and try again.",250,6000,4000);
				NoChange = 0;
			} else if(NoChange > 0) {
				NoChange = 0;
			};
				
		});
		/* REGISTRANTS AND ATTENDEE TEXTBOX START */
		
		/* REMOVE ONLY CHECKED */
		$("#RemoveChecked").bind("click",function() {
			if(confirm("Are you sure you want to remove the checked attendees from this activity?")) {
				var cleanData = "";			
				
				$.blockUI({ message: '<h1>Removing Selected Attendees...</h1>'});
				$.ajax({
					url: "/AJAX_adm_Activity/removeCheckedAttendees", 
					type: 'post',
					data: { PersonList: SelectedMembers,AttendeeList: SelectedAttendees, ActivityID: nActivity, returnFormat: "plain" },
					dataType: 'json',
					success: function(data) {
						if(data.STATUS) {
							addMessage(data.STATUSMSG,250,6000,4000);
							clearSelectedMembers();
						} else {
							addError(data.STATUSMSG,250,6000,4000);
						}
						
						updateStats();
						$.unblockUI();
						updateRegistrants(nId, nStatus);
					}
				});
			}
		});
		
		/* REMOVE ALL PEOPLE FROM Activity */
		$("#RemoveAll").bind("click",function() {
			if(confirm("WARNING!\nYou are about to remove ALL attendees from this Activity!\nAre you sure you wish to continue?")) {
				var cleanData = "";

				$.blockUI({ message: '<h1>Removing All Attendees...</h1>'});
				$.ajax({
					url: '/AJAX_adm_Activity/removeAllAttendees',
					type: 'post',
					data: { ActivityID: nActivity, returnFormat: 'plain' },
					dataType: 'json',
					success: function(data) {
						if(data.STATUS) {
							addMessage(data.STATUSMSG,250,6000,4000);
							updateStats();
							$.unblockUI();
							clearSelectedMembers();
							updateRegistrants(nId, nStatus);
						} else {
							addError(data.STATUSMSG,250,6000,4000);
							updateStats();
							$.unblockUI();
							updateRegistrants();
						}
					}
					
				});
			}
		});
		
		/* PRINT SELECTED ONLY START */
		$("#PrintCMECert").bind("click", this, function() {	//CME CERTS
			if($("#PrintSelected").attr("checked") == 'checked') {				
				window.open("/report/CMECert?ActivityID=" + nActivity + "&ReportID=5&selectedAttendees=" + SelectedAttendees);
			} else {
				window.open("/report/CMECert?ActivityID=" + nActivity + "&ReportID=5");
			};
		});
		
		$("#PrintCNECert").bind("click", this, function() {	//CNE CERTS
			if($("#PrintSelected").attr("checked") == 'checked') {						//CHECK IF PRINTSELECTED IS CHECKED
				if(SelectedAttendees != "") {
					window.open("/report/CNECert?ActivityID=' nActivity + '&ReportID=6&SelectedAttendees=" + SelectedAttendees);
				} else {
					addError("You must select registrants",250,6000,4000);
				};
			} else {
				window.open("/report/CNECert?ActivityID=" + nActivity + "&ReportID=6");
			};
		});
		
		$(".PrintSigninSheet").bind("click", this, function() {	//CME CERTS
			if($("#PrintSelected").attr("checked") == 'checked') {						//CHECK IF PRINTSELECTED IS CHECKED
				if(SelectedAttendees != "") {
					if($.ListGetAt(this.id,2,"|") == "Y") {
						window.open("/report/SigninSheet?ActivityID=" + nActivity + "&ssn=1&ReportID=12&SelectedAttendees=" + SelectedAttendees);
					} else {
						window.open("/report/SigninSheet?ActivityID=" + nActivity + "&ssn=0&ReportID=12&SelectedAttendees=" + SelectedAttendees);
					}
				} else {
					addError("You must select registrants",250,6000,4000);
				};
			} else {
				if($.ListGetAt(this.id,2,"|") == "Y") {
					window.open("/report/SigninSheet?ActivityID=" + nActivity + "&ssn=1&ReportID=12");
				} else {
					window.open("/report/SigninSheet?ActivityID=" + nActivity + "&ssn=0&ReportID=12");
				}
			};
		});
		
		$("#PrintMailingLabels").bind("click", this, function() {	//MAILING LABELS
			if($("#PrintSelected").attr("checked") == 'checked') {						//CHECK IF PRINTSELECTED IS CHECKED
				if(SelectedMembers != "") {
					window.open("/report/MailingLabels?ActivityID=" + nActivity + "&ReportID=3&Print=1&SelectedAttendees=" + SelectedAttendees);
				} else {
					addError("You must select registrants",250,6000,4000);
				};
			} else {
				window.open("/report/MailingLabels?ActivityID=" + nActivity + "&ReportID=3&Print=1");
			};
		});
		
		$("#PrintNameBadges").bind("click", this, function() {	//NAME BADGES
			if($("#PrintSelected").attr("checked") == 'checked') {						//CHECK IF PRINTSELECTED IS CHECKED
				if(SelectedMembers != "") {
				
					window.open("/report/NameBadges?ActivityID=" + nActivity + "&SelectedMembers=" + SelectedMembers);
				} else {
					addError("You must select registrants",250,6000,4000);
				};
			} else {
				window.open("/report/NameBadges?ActivityID=" + nActivity + "");
			};
		});
		/* PRINT SELECTED ONLY END */
});
</script>
<div class="ViewSection">
	<div id="RegistrantsContainer"></div>
	<div id="RegistrantsLoading" class="Loading"><img src="/admin/_images/ajax-loader.gif" />
	<div>Please Wait</div></div>
</div>
