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

function cancelButton() {
	$("#CreditsDialog").dialog("close");
}

function clearSelectedMembers() {
	SelectedAttendees = '';
	SelectedMembers = '';
	SelectedCount = 0;
	$("#label-status-selected").html('0');
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

function resetAttendee(nA,nP,sP) {
	$.ajax({
		url: "/AJAX_adm_Activity/resetAttendee", 
		type: 'post',
		data: { attendeeId: nP, ActivityID: nA, PaymentFlag: sP },
		success: function(data) {
			if(data.STATUS) {				
				addMessage(data.STATUSMSG,250,6000,4000);
				updateStats();
				updateRegistrants();
			} else {
				addError(data.STATUSMSG,250,6000,4000);
			}
		}
	});
}

function saveAttendee() {
	$.blockUI({ message: '<h1>Adding Attendee...</h1>'});
	
	$.post("/AJAX_adm_Activity/saveAttendee", { PersonID: $("#AttendeeID").val(), ActivityID: nActivity, returnFormat: "plain" },
		function(returnData) {
			cleanData = $.trim(returnData);
			status = $.ListGetAt(cleanData,1,"|");
			statusMsg = $.ListGetAt(cleanData,2,"|");
			
			if(status == 'Success') {
				updateRegistrants(nPageNo, nStatus);
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

function updateAttendeeFilterCounts() {
	$.each($('.attendees-filter').children(), function(i, item) {
		// DETERMINE IF CURRENT LIST ITEM IS A STATUS ROW
		if($(this).hasClass('attendee-status')) {
			var status = this.id.split('status')[1];
			var countContainer = $(this).find('span.attendee-status-count');
			
			// PROVIDE STATUS COUNT
			countContainer.html('(' + eval('status' +  status + 'Count') + ')');
		}
	});
}

function updatePagesDropdown() {
	var pagesContainer = $('.pages');
	var pageSelector = $('.pageSelector');
	
	// CLEAR CURRENT PAGES LIST
	pagesContainer.children().remove();
	
	// CREATE NEW PAGES LIST
	for(var i=1; i<=totalPages; i++) {
		var pageLink = $('<a />').addClass('page').attr('href','/activities/adm_participants?ActivityID=' + nActivity + '&status=' + nStatus + '&page=' + i).text(i);
		var page = $('<li />').append(pageLink).appendTo(pagesContainer);
	}
	
	// UPDATE CURRENT PAGE NUMBER
	$('.pageSelector').text(nPageNo);
	
	//console.log(totalPages);
	// DETERMINE IF NEXT/PREVIOUS PAGING BUTTONS NEED DISABLED
	if(nPageNo == 1) $('a.previous').addClass('disabled');
	if(nPageNo >= totalPages) $('a.next').addClass('disabled');
}

function updateRegistrants(nPage, nStatus) {
	$("#RegistrantsLoading").show();
	
	$.ajax({
		url: '/activity_participants/ahah', 
		type: 'get',
		data: { activityId: nActivity, status: nStatus, selectedAttendees: SelectedAttendees, page: nPage },
		success: function(data) {
			$("#RegistrantsContainer").html(data);
			$("#RegistrantsLoading").hide();
			
			$(".AllAttendees").unbind();
			$(".AllAttendees").isPerson();
			
			// PLACE CHECKMARK BY ACTIVE STATUS
			$('.active-status').remove();
			$('#status' + nStatus).find('a').prepend('<i class="icon-ok active-status"></i> ');
			
			// REPLACE ACTIVE STATUS TITLE
			$('.attendee-status-title').text($('#status' + nStatus).find('a span.attendee-status-name').text());
			
			// CHECK IF ALL VIEWABLE ATTENDEES ARE SELECTED
			if($(".AllAttendees").length == TotalAttendeeCount && SelectedAttendees.split(',').length == TotalAttendeeCount) {
				// CHECK THE CHECK ALL BOX
				$('.js-check-all').attr('checked', true);
			}
			
			// CHECK IF ATTENDEE HAS BEEN MARKED AS SELECTED	
			$(".AllAttendees").each(function() {
				$row = $(this);
				var $checkBox = $row.find('.MemberCheckbox');
				var nPerson = $row.find('.personId').val();
				var nAttendee = $row.find('.attendeeId').val();
				
				// DETERMINE IF CURRENT ROW NEEDS CHECKED
				if($.ListFind(SelectedAttendees, nAttendee)) {
					$row.addClass('alert alert-info');
					$checkBox.attr('checked', true);
				}
				
				$checkBox.click(function() {
					if($(this).attr("checked")) {
						$("#attendeeRow-" + nAttendee).addClass('alert alert-info');
						
						// ADD CURRENT MEMBER TO SELECTEDMEMBERS LIST
						addSelectedAttendee({
							person:nPerson,
							attendee:nAttendee
						});
					} else {
						$("#attendeeRow-" + nAttendee).removeClass('alert alert-info');
						
						// REMOVE CURRENT MEMBER FROM SELECTEDMEMBERS LIST
						removeSelectedPerson({
							person:nPerson,
							attendee:nAttendee
						});
					}
				});
			});
		}
	});
}

function updateSelectedCount(nAmount) {
	SelectedCount = SelectedCount + nAmount;
	if(SelectedCount > 0) {
		$(".js-partic-actions .btn").removeClass('disabled');
	} else {
		$(".js-partic-actions .btn").addClass('disabled');
	}
	$("#label-status-selected").text(SelectedCount);
	$("#statusSelected span.attendee-status-count").text("(" + SelectedCount + ")");
	
}

function updateStatusDate(nAttendee,nType) {
	$.ajax({
		url: "/AJAX_adm_Activity/getAttendeeDate", 
		type: 'post',
		data: { AttendeeId: nAttendee, type: nType },
		dataType: 'json',
		success: function(data) {
			if(data.STATUS) {
				$("#current-attendee-date-" + nAttendee).val(data.PAYLOAD.month + '/' + data.PAYLOAD.day + '/' + data.PAYLOAD.year);
				$("#current-attendee-status-" + nAttendee).val(nType);
				$("#datefill-" + nAttendee).html(data.STATUSMSG);
				$("#editdatelink-" + nAttendee).show();
			} else {
				addError('test',500,5000,2500);
			}
		}
	});
}

$(document).ready(function() {
	var $attendeeRemover = $('.js-remove-attendees');
	var $attendeeSelectedViewLink = $('.js-status-selected');
	var $attendeeStatusChanger = $('.js-change-status');
	var $attendeeStatusViewChange = $('.js-view-attendee-statusdate');
	var $checkAll = $('.js-check-all');
	var $containerDiv = $('.js-registrants-container');
	var $fakeAttendeeRemover = $('.js-delete-link');
	var $loadingDiv = $('.js-registrants-loading');
	var $pager = $('a.page,a.first,a.last,a.next,a.previous');
	var $printer = $('.js-print');
	var $statusDateEditor = $(".js-edit-status-date");
	var $statusFilter = $('.attendees-filter li.js-attendee-status');
	
	MaxRegistrants = $("#MaxRegistrants").val();
	AddlAttendees = $("#AddlAttendees").val();
	NoChange = 0;
	
	updateRegistrants(nPageNo, nStatus);
	
	// CHANGE ATTENDEE STATUS DATE THAT IS SHOWN
	$attendeeStatusViewChange.live('click', function() {
		var nAttendee = this.id.split('-')[1];
		var nType = this.id.split('-')[2];
		
		updateStatusDate(nAttendee,nType);
				
		// PLACE CHECKMARK BY ACTIVE STATUS
		$('#view-attendee-statuses-' + nAttendee).find('a .active-status').remove();
		$(this).prepend('<i class="icon-ok active-status"></i> ');
	});
	
	// VIEW CHECKMARKED ATTENDEE FILTER LINK
	$attendeeSelectedViewLink.live('click', function() {
		var statusName = this.id.split('status')[1];
		
		if(SelectedAttendees.length > 0) {
			updateRegistrants(1, statusName);
		} else {
			addError('You must select participants first.',500,6000,4000);
		}
	});
	
	$checkAll.live('click', function() {
		var $allAttendees = $(".AllAttendees");
		var selectAll = $(this).attr("checked");
		console.log($allAttendees);
		$allAttendees.each(function() {
			var $row = $(this);
			var $checkBox = $row.find('.MemberCheckbox');
			var nPerson = $row.find('.personId').val();
			var nAttendee = $row.find('.attendeeId').val();
			var rowChecked = $checkBox.attr("checked");
			
			if(selectAll && !rowChecked) {
				// ADD CURRENT MEMBER TO SELECTEDMEMBERS LIST
				addSelectedAttendee({
					person: nPerson,
					attendee: nAttendee
				});
				
				$checkBox.attr("checked",true);
				
				// CHANGE BACKGROUND COLOR OF PERSONROW
				$row.addClass('alert alert-info');
			} else if(!selectAll && rowChecked) {
				if(rowChecked) {
					// ADD CURRENT MEMBER TO SELECTEDMEMBERS LIST
					removeSelectedPerson({
						person: nPerson,
						attendee: nAttendee
					});
					
					$checkBox.attr("checked",false);
					
					// CHANGE BACKGROUND COLOR OF PERSONROW
					$row.removeClass('alert alert-info');
				}
			}
		});
	});
	
	$fakeAttendeeRemover.live("click",function() {
		var $row = $(this).parents('.personRow');
		var attendee = $row.find('.attendeeId').val();
		
		$.ajax({
			type:'post',
			dataType:'json',
			url:'/ajax_adm_activity/removeAttendeeByID',
			data:{
				'attendeeId':attendee
			},
			async:false,
			success:function(data) {
				if(data.STATUS) {
					$row.remove();
				}
			}
		});
	});
	
	$pager.live("click",function() {
		var $btnNext = $('.pager-simple a.next');
		var $btnPrev = $('.pager-simple a.previous');
		var $elem = $(this);
		var $pageSelector = $('.pageSelector');
		var pageURL = '/activities/adm_participants?ActivityID=13660&status=0&page=';
		var pageNext;
		var pagePrev;
								 
		nPageNo = parseInt($.Mid(this.href,$.Find('page=',this.href)+5,$.Len(this.href)-$.Find('page=',this.href)+4));
		
		pageNext = (parseInt(nPageNo)+1);
		pagePrev = (parseInt(nPageNo)-1);
		
		if(nPageNo >= 1 && nPageNo <= totalPages) {
			// UPDATE SIMPLE PAGER LINKS
			if(pageNext <= totalPages) {
				$btnNext.attr('href',pageURL + pageNext).removeClass('disabled');
				passGoCollect$200 = true;
			} else {
				$btnNext.attr('href','javascript://');
				$btnNext.addClass('disabled');
			}
			
			if(pagePrev >= 1) {
				$btnPrev.attr('href',pageURL + pagePrev).removeClass('disabled');
				passGoCollect$200 = true;
			} else {
				$btnPrev.attr('href','javascript://');
				$btnPrev.addClass('disabled');
			}
		
			// UPDATE SIMPLE PAGER PAGE DROPDOWN
			$pageSelector.text(nPageNo);
			
			// UPDATE COOKIE FOR CURRENT ACTIVITY PAGE NUMBER
			$.post("/UserSettings/setAttendeePage", { ActivityID: nActivity, Page: nPageNo });
			
			// RELOAD DATA
			updateRegistrants(nPageNo, nStatus);
		}
		
		return false;
	});
	
	$statusDateEditor.live("click", this, function() {
		var CurrID = this.id;
		var nAttendee = this.id.split('-')[1];
		var dtCurrDate = $.Trim($("#current-attendee-date-" + nAttendee).val());
		var dtStatusMask;
		var sDate = dtCurrDate.split(' ')[0];
		var $cancelEdit = $('#CancelDate-' + nAttendee);
		var $editStatusDate = $("#edit-attendee-date-" + nAttendee);
		var $saveEdit = $('#SaveDate-' + nAttendee);
		var $viewStatusDate = $("#view-attendee-date-" + nAttendee);
		var $inputEdit = $('#EditDateField-' + nAttendee);
		
		// SET CURRENT STATUS DATE VALUE IN HTML ELEMENTS
		$("#CurrStatusDate-" + nAttendee).val(dtCurrDate);
		$("#EditDateField-" + nAttendee).val(dtCurrDate);
		
		// SHOW EDIT FORM
		$viewStatusDate.hide();
		$editStatusDate.show();
		
		$cancelEdit.click(function() {
			$editStatusDate.hide();
			$viewStatusDate.show();
			
			$cancelEdit.unbind();
			$editStatusDate.unbind();
			$saveEdit.unbind();
			$viewStatusDate.unbind();
		});
	
		$inputEdit.keydown(function(e) {
			// UPDATE THE JS VAR THAT WILL REFILL THIS
			if($.Len($(this).val()) > 0) {
				dtStatusMask = $(this).val();
			}
			
			// DETERMINE IF KEY PRESSED WAS THE ENTER KEY
			if(e.keyCode == 13) {
				saveStatusDate($("#EditDateField-" + nAttendee).val(), $("#current-attendee-status-" + nAttendee).val());
			}
		});
		
		$saveEdit.click(function() {
			saveStatusDate($("#EditDateField-" + nAttendee).val(), $("#current-attendee-status-" + nAttendee).val());
		});
		
		// SAVE FUNCTION
		function saveStatusDate(dtDate, nType) {
			// DETERMINE THERE IS A STATUS AND A DATE
			if(nType != "" && dtDate.length > 0) {
				$.ajax({
					url: "/AJAX_adm_Activity/saveAttendeeDate", 
					type: 'post',
					data: { attendeeId: nAttendee, DateValue: dtDate, Type: nType, returnFormat: "plain" },
					dataType: 'json',
					success: function(data) {
						if(data.STATUS) {
							addMessage(data.STATUSMSG,250,6000,4000);
							updateRegistrants(nPageNo, nStatus);
						} else {
							addError(data.STATUSMSG,250,6000,4000);
							
							$editStatusDate.hide();
							$viewStatusDate.show();
						}
					}
				});
			} else {
				addError("You must provide full date and time.",250,6000,4000);
				$("#EditDateField-" + nAttendee).focus();
				$("#EditDateField-" + nAttendee).val(dtStatusMask);
			}
		}
	});
	
	// CHANGE THE VIEWABLE ATTENDEES BASED ON STATUS
	$statusFilter.live("click",function() {
		var statusLink = $(this).find('a');
		var countContainer = $(this).find('span');
		
		// UPDATE THE CURRENT STATUS
		nStatus = parseInt(this.id.split('status')[1]);
		
		$containerDiv.html("");
		$loadingDiv.show();
		
		// UPDATE THE ATTENDEE STATUS COOKIE FOR CURRENT ACTIVITY
		$.ajax({
			url: "/UserSettings/setAttendeeStatus", 
			type: 'post',
			data: { ActivityID: nActivity, status: nStatus },
			success: function(data) {
				nPageNo = 1;
				updateRegistrants(nPageNo, nStatus);
			}
		});
		
		return false;
	});
	
	$attendeeStatusChanger.live('click', function(e) {
		var updateToStatus = this.id.split('-')[2];
		
		$.ajax({
			url: "/AJAX_adm_Activity/updateAttendeeStatuses",
			type: 'post',
			data: { AttendeeList: SelectedAttendees, ActivityID: nActivity, StatusID: updateToStatus },
			dataType: 'json',
			success: function(data)  {
				if(data.STATUS) {
					addMessage(data.STATUSMSG,500,6000,4000);
					updateStats();
					clearSelectedMembers();
					
					updateRegistrants(nPageNo, nStatus);
				} else {
					addError(data.STATUSMSG,500,6000,4000);
				}
			}
		});
	});
	
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
			addError('Please adjust the value you want to update and try again.',250,6000,4000);
			NoChange = 0;
		} else if(NoChange > 0) {
			NoChange = 0;
		};
			
	});
	/* REGISTRANTS AND ATTENDEE TEXTBOX END */
	
	/* REMOVE ONLY CHECKED */
	$attendeeRemover.live('click', function() {
		var cleanData = "";
		
		// DETERMINE IF THERE ARE ATTENDEES SELECTED
		if(SelectedAttendees.length > 0) {
			// DETERMINE IF THE USER MEANS TO REMOVE SELECTED ATTENDEES
			if(confirm("Are you sure you want to remove the checked attendees from this activity?")) {		
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
						updateRegistrants(nPageNo, nStatus);
					}
				});
			}
		} else {
			addError('You must select attendees to remove.',500,3000,2500);
		}
	});
	
	/* PRINT SELECTED ONLY START */
	$printer.live('click', function() {
		var task = this.id.split('-')[1];
		
		switch(task) {
			case 'cme':
				// DETERMINE IF THERE ARE ATTENDEES SELECTED
				if(SelectedAttendees.length > 0) {			
					window.open("/report/CMECert?ActivityID=" + nActivity + "&ReportID=5&selectedAttendees=" + SelectedAttendees);
				} else {
					window.open("/report/CMECert?ActivityID=" + nActivity + "&ReportID=5");
				}
				break;
			
			case 'cne':
				if(SelectedAttendees.length > 0) {			
					window.open("/report/CNECert?ActivityID=" + nActivity + "&ReportID=6&selectedAttendees=" + SelectedAttendees);
				} else {
					window.open("/report/CNECert?ActivityID=" + nActivity + "&ReportID=6");
				}
				break;
		}
	});
});