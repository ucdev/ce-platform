function addSelectedRow(params) {
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

function removeSelectedRow(params) {
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

$(document).ready(function() {
	MaxRegistrants = $("#MaxRegistrants").val();
	AddlAttendees = $("#AddlAttendees").val();
	NoChange = 0;
	
	updateRegistrants(nPageNo, nStatus);
	
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
	
	/* PRINT SELECTED ONLY START */
	$printer.live('click', function() {
	});
});