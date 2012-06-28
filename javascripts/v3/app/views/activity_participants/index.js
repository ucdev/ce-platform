$.Class("ccpd.activity_participants",{
	setup:function(params) {
	},
	
	init: function() {
		this.activity = ccpd.tier2;
	},
	
	domReady: function(params) {
		this.attendeeRemover = $('.js-remove-attendees');
		this.attendeeSelectedViewLink = $('.js-status-Selected');
		this.attendeeStatusChanger = $('.js-change-status');
		this.checkAll = $('.js-check-all');
		this.pager = $('.js-pager-simple');
		this.pager.label = $('.js-page-selector');
		this.pager.list = $('.js-pages');
		this.pager.next = $('.js-next-page');
		this.pager.prev = $('.js-prev-page');
		this.printer = $('.js-print');
		this.statusFilter = $('.js-attendees-filter li.js-attendee-status');
		this.contentContainer = $('.js-registrants-container');
		this.loader = $('.js-registrants-loading');
		
		var participants = this;
		
		this.updateRegistrants({
			page: ccpd.tier3.nPageNo, 
			status: ccpd.tier3.nStatus
		});
				
		participants.updatePagesDropdown();
		
		this.attendeeRemover.click(function() {
			participants.removeAttendees();
		});
		
		// VIEW CHECKMARKED ATTENDEES FILTER LINK
		this.attendeeSelectedViewLink.click(function() {
			participants.viewCheckSelectedRows();
		});
		
		this.attendeeStatusChanger.click(function() {
			participants.updateAttendeeStatuses();
		});
		
		this.checkAll.click(function() {
			participants.selectAllAttendees();
		});
		
		this.pager['next'].click(function() {
			participants.changePage('next');
		});
		
		this.pager['prev'].click(function() {
			participants.changePage('prev');
		});
		
		this.printer.click(function() {
			participants.printDocument();
		});
		
		this.statusFilter.click(function() {
			// UPDATE THE CURRENT STATUS
			ccpd.tier3.nStatus = this.id.replace('status','');
			
			participants.changeActiveAttendeeStatus();
		});
	},
	
	activity: [],
	
	changePage: function(dir) {
		console.log(ccpd.tier3.nPageNo);
		if(ccpd.tier3.nPageNo >= 1 && ccpd.tier3.nPageNo <= ccpd.tier3.totalPages) {
			switch(dir) {
				case 'next':
					ccpd.tier3.nPageNo += 1
					break;
				case 'prev':
					ccpd.tier3.nPageNo -= 1
					break;
			}
			
			// UPDATE SIMPLE PAGER LINKS
			if(ccpd.tier3.nPageNo <= ccpd.tier3.totalPages) {
				this.pager['next'].removeClass('disabled');
			} else {
				this.pager['next'].addClass('disabled');
			}
			
			if(ccpd.tier3.nPageNo >= 1) {
				this.pager['prev'].removeClass('disabled');
			} else {
				this.pager['prev'].addClass('disabled');
			}
		
			// UPDATE SIMPLE PAGER PAGE DROPDOWN
			this.pager['label'].text(ccpd.tier3.nPageNo);
			
			// UPDATE COOKIE FOR CURRENT ACTIVITY PAGE NUMBER
			$.post("/UserSettings/setAttendeePage", { ActivityID: this.activity.nActivity, Page: ccpd.tier3.nPageNo });
			
			// RELOAD DATA
			this.updateRegistrants(this.activity.nPageNo, ccpd.tier3.nStatus);
		}
	},
	
	changeActiveAttendeeStatus: function() {
		var statusLink = $(this).find('a');
		var countContainer = $(this).find('span');
		var participants = this;
		
		this.contentContainer.html("");
		this.loader.show();
		
		// UPDATE THE ATTENDEE STATUS COOKIE FOR CURRENT ACTIVITY
		$.ajax({
			url: "/UserSettings/setAttendeeStatus", 
			type: 'post',
			data: { ActivityID: this.activity.nActivity, status: ccpd.tier3.nStatus },
			success: function(data) {
				ccpd.tier3.nPageNo = 1;
				participants.updateRegistrants(ccpd.tier3.nPageNo, ccpd.tier3.nStatus);
			}
		});
	},
	
	printDocument: function() {
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
	},
	
	removeAttendees: function() {
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
	},
	
	selectAllAttendees: function() {
		var $allAttendees = $(".js-all-attendee");
		var selectAll = this.checkAll.attr("checked");
		
		$allAttendees.each(function() {
			var $row = $(this);
			var $checkBox = $row.find('.MemberCheckbox');
			var nPerson = $row.find('.personId').val();
			var nAttendee = $row.find('.attendeeId').val();
			var rowChecked = $checkBox.attr("checked");
			
			if(selectAll && !rowChecked) {
				// ADD CURRENT MEMBER TO SELECTEDMEMBERS LIST
				addSelectedRow({
					person: nPerson,
					attendee: nAttendee
				});
				
				$checkBox.attr("checked",true);
				
				// CHANGE BACKGROUND COLOR OF PERSONROW
				$row.addClass('alert alert-info');
			} else if(!selectAll && rowChecked) {
				if(rowChecked) {
					// ADD CURRENT MEMBER TO SELECTEDMEMBERS LIST
					removeSelectedRow({
						person: nPerson,
						attendee: nAttendee
					});
					
					$checkBox.attr("checked",false);
					
					// CHANGE BACKGROUND COLOR OF PERSONROW
					$row.removeClass('alert alert-info');
				}
			}
		});
	},
	
	updateAttendeeStatuses: function() {
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
	},

	updateFilterCounts: function() {
		$.each($('.js-attendees-filter').children(), function(i, item) {
			// DETERMINE IF CURRENT LIST ITEM IS A STATUS ROW
			if($(this).hasClass('js-attendee-status')) {
				var status = this.id.split('status')[1];
				var countContainer = $(this).find('span.js-attendee-status-count');
				// PROVIDE STATUS COUNT
				countContainer.html('(' + eval('ccpd.tier3.status' +  status + 'Count') + ')');
			}
		});
	},
	
	updatePagesDropdown: function() {
		// CLEAR CURRENT PAGES LIST
		this.pager['list'].children().remove();
		
		// CREATE NEW PAGES LIST
		for(var i=1; i<=ccpd.tier3.totalPages; i++) {
			var pageLink = $('<a />').addClass('page').attr('href','/activity_participants/AHAH/' + this.activity.nActivity + '?status=' + ccpd.tier3.nStatus + '&page=' + i).text(i);
			var page = $('<li />').append(pageLink).appendTo(this.pager['list']);
		}
		
		// UPDATE CURRENT PAGE NUMBER
		this.pager['label'].text(ccpd.tier3.nPageNo);
		
		// DETERMINE IF NEXT/PREVIOUS PAGING BUTTONS NEED DISABLED
		if(ccpd.tier3.nPageNo == 1) this.pager['prev'].addClass('disabled');
		if(ccpd.tier3.nPageNo >= ccpd.tier3.totalPages) this.pager['next'].addClass('disabled');
		
		console.log(ccpd.tier3.totalPages);
	},
	
	updateRegistrants: function(params) {
		var page;
		var participants = this;
		var status;
		
		if(typeof params == 'object' && typeof params.page == 'number') {
			page = params.page;
		} else {
			page = ccpd.tier3.nPageNo;
		}
		if(typeof params == 'object' && typeof params.status == 'number') {
			status = params.status;
		} else {
			status = ccpd.tier3.nStatus;
		}
		
		$.ajax({
			url: '/activity_participants/ahah', 
			type: 'get',
			data: { key: this.activity.nActivity, status: status, selectedAttendees: ccpd.tier3.selectedRows, page: page  },
			success: function(data) {
				var activeStatusCheckMark = $('<i/>').addClass('icon-ok active-status js-active-status');
				var allAttendees = $('.js-all-attendee');
				
				participants.contentContainer.html(data);
				participants.loader.hide();
				
				allAttendees.unbind();
				
				// PLACE CHECKMARK BY ACTIVE STATUS
				$('.js-active-status').remove();
				$('.js-attendee-status-' + status).find('a').prepend(activeStatusCheckMark);
				
				// REPLACE ACTIVE STATUS TITLE
				$('.js-attendee-status-title').text($('.js-attendee-status-' + status).find('a span.js-attendee-status-name').text());
				
				// CHECK IF ALL VIEWABLE ATTENDEES ARE SELECTED
				if(allAttendees.length == ccpd.tier3.TotalAttendeeCount && ccpd.tier3.selectedRows.split(',').length == ccpd.tier3.TotalAttendeeCount) {
					// CHECK THE CHECK ALL BOX
					participants.checkAll.attr('checked', true);
				}
				
				// CHECK IF ATTENDEE HAS BEEN MARKED AS SELECTED	
				allAttendees.each(function() {
					var attendeeId = $(this).find('.attendeeId').val();
					var attendeeContainer;
					
					ccpd.tier3.rows[attendeeId] = [];
					
					attendeeContainer = ccpd.tier3.rows[attendeeId];
					
					attendeeContainer['name'] = $('.js-attendee-name').text();
					
					attendeeContainer = new ccpd.activity_participants.participant({
						$elem: $(this)
					});
					/*
					
					// DETERMINE IF CURRENT ROW NEEDS CHECKED
					if($.ListFind(SelectedAttendees, nAttendee)) {
						$row.addClass('alert alert-info');
						$checkBox.attr('checked', true);
					}
					
					$checkBox.click(function() {
						if($(this).attr("checked")) {
							$row.addClass('alert alert-info');
							
							// ADD CURRENT MEMBER TO SELECTEDMEMBERS LIST
							addSelectedRow({
								person:nPerson,
								attendee:nAttendee
							});
						} else {
							$row.removeClass('alert alert-info');
							
							// REMOVE CURRENT MEMBER FROM SELECTEDMEMBERS LIST
							removeSelectedRow({
								person:nPerson,
								attendee:nAttendee
							});
						}
					});
					*/
				});
			}
		});
	},
	
	viewSelectedRows: function() {
		var statusName = this.id.split('status')[1];
		
		if(SelectedAttendees.length > 0) {
			updateRegistrants(1, statusName);
		} else {
			addError('You must select participants first.',500,6000,4000);
		}
	}
}, {});

$.Class("ccpd.activity_participants.participant",{},{
	init:function(params) {
		var participant = this;
		this.parent = ccpd.activity_participants;
		
		participant.row = $(params.$elem);
		
		ccpd.tier3.rows[this.id] = participant;
	},
	
	addSelectedRow: function() {
		if(!$.ListFind(ccpd.tier3.selectedRows, this.id, ',')) {
			ccpd.tier3.selectedRows = $.ListAppend(ccpd.tier3.selectedRows, this.id, ',');
			
			this.updateSelectedCount(1);
		} 
	},
	
	changeAttendeeViewableStatus: function(params) {
		var participant = this;
		
		$.ajax({
			url: "/AJAX_adm_Activity/getAttendeeDate", 
			type: 'post',
			data: { AttendeeId: this.id, type: params.type },
			dataType: 'json',
			success: function(data) {
				if(data.STATUS) {
					$("#current-attendee-date-" + participant.id).val(data.PAYLOAD.month + '/' + data.PAYLOAD.day + '/' + data.PAYLOAD.year);
					$("#current-attendee-status-" + participant.id).val(params.type);
					$("#datefill-" + participant.id).html(data.STATUSMSG);
					$("#editdatelink-" + participant.id).show();
				} else {
					addError('test',500,5000,2500);
				}
			}
		});
				
		// PLACE CHECKMARK BY ACTIVE STATUS
		$('#view-attendee-statuses-' + this.id).find('a .active-status').remove();
		params.elem.prepend('<i class="icon-ok active-status"></i> ');
	},
	
	domReady: function() {
		this.attendeeStatusViewChange = this.row.find('.js-view-attendee-statusdate');
		this.checkBox = this.row.find('.js-selected-checkbox');
		this.fakeAttendeeRemover = this.row.find('.js-delete-link');
		this.id = this.row.find('.attendeeId').val();
		this.personId = this.row.find('.personId').val();
		this.statusDateEditor = this.row.find('.js-edit-status-date');
		
		participant.attendeeStatusViewChange.click(function() {
			participant.changeAttendeeViewableStatus({
				elem: $(this),
				type: this.id.split('-')[2]
			});
		});
		
		// DETERMINE IF CURRENT ROW NEEDS CHECKED
		if($.ListFind(ccpd.tier3.selectedRows, this.id)) {
			participant.row.addClass('alert alert-info');
			participant.checkBox.attr('checked', true);
		}
		
		participant.checkBox.click(function() {
			participant.selectRow();
		});
		
		participant.fakeAttendeeRemover.click(function() {
			participant.deleteFakeAttendee();
		});
		
		participant.statusDateEditor.click(function() {
			participant.editStatusDate();
		});
		
		participant.row.isPerson();
	},
	
	deleteFakeAttendee: function() {
		var participant = this;
		
		$.ajax({
			type:'post',
			dataType:'json',
			url:'/ajax_adm_activity/removeAttendeeByID',
			data:{
				'attendeeId': participant.id
			},
			async:false,
			success:function(data) {
				if(data.STATUS) {
					participant.row.remove();
				}
			}
		});
	},
	
	editStatusDate: function() {
		this.parent = ccpd.activity_participants;
		var participant = this;
		var $currAttendeeStatus = $("#current-attendee-status-" + participant.id);
		var currDateContainer = $("#CurrStatusDate-" + participant.id);
		var dtCurrDate = $.Trim($("#current-attendee-date-" + participant.id).val());
		var dtStatusMask;
		var sDate = dtCurrDate.split(' ')[0];
		var $cancelEdit = $('#CancelDate-' + participant.id);
		var $editStatusDate = $("#edit-attendee-date-" + participant.id);
		var $saveEdit = $('#SaveDate-' + participant.id);
		var $viewStatusDate = $("#view-attendee-date-" + participant.id);
		var $inputEdit = $('#EditDateField-' + participant.id);
		
		// SET CURRENT STATUS DATE VALUE IN HTML ELEMENTS
		currDateContainer.val(dtCurrDate);
		$inputEdit.val(dtCurrDate);
		
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
				saveStatusDate($inputEdit.val(), $currAttendeeStatus.val());
			}
		});
		
		$saveEdit.click(function() {
			saveStatusDate($inputEdit.val(), $currAttendeeStatus.val());
		});
		
		// SAVE FUNCTION
		function saveStatusDate(dtDate, nType) {
			// DETERMINE THERE IS A STATUS AND A DATE
			if(nType != "" && dtDate.length > 0) {
				$.ajax({
					url: '/AJAX_adm_Activity/saveAttendeeDate', 
					type: 'post',
					data: { attendeeId: participant.id, DateValue: dtDate, Type: nType },
					dataType: 'json',
					success: function(data) {
						if(data.STATUS) {
							addMessage(data.STATUSMSG,250,6000,4000);
							participant.parent.updateRegistrants({
								 page: participant.parent.activity.nPageNo, 
								 status: participant.parent.activity.nStatus
							});
						} else {
							addError(data.STATUSMSG,250,6000,4000);
							
							$editStatusDate.hide();
							$viewStatusDate.show();
						}
					}
				});
			} else {
				addError('You must provide full date and time.',250,6000,4000);
				$inputEdit.focus();
				$inputEdit.val(dtStatusMask);
			}
		}
	},
	
	removeSelectedRow: function() {
		ccpd.tier3.selectedRows = $.ListDeleteAt(ccpd.tier3.selectedRows, $.ListFind(ccpd.tier3.selectedRows, this.id));
		
		this.updateSelectedCount(-1);
	}, 
	
	selectRow: function() {
		if(this.checkBox.attr('checked')) {
			this.row.addClass('alert alert-info');
			
			// ADD CURRENT MEMBER TO SELECTEDROWS LIST
			this.addSelectedRow();
		} else {
			this.row.removeClass('alert alert-info');
			
			// REMOVE CURRENT MEMBER FROM SELECTEDROWS LIST
			this.removeSelectedRow();
		}
	},
	
	updateSelectedCount: function(val) {
		ccpd.tier3.selectedCount += val;
		if(ccpd.tier3.selectedCount > 0) {
			$(".js-partic-actions .btn").removeClass('disabled');
		} else {
			$(".js-partic-actions .btn").addClass('disabled');
		}
		$(".js-label-status-selected").text(ccpd.tier3.selectedCount);
	}
}, {});


(function(){
	
})();
