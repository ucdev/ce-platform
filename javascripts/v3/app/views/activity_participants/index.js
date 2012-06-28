$.Class("ccpd.activity_participants",{
	setup:function(params) {
	},
	
	init:function(params) {
		this.attendeeRemover = $('.js-remove-attendees');
		this.attendeeSelectedViewLink = $('.js-status-Selected');
		this.attendeeStatusChanger = $('.js-change-status');
		this.checkAll = $('.js-check-all');
		this.pager = $('a.page,a.first,a.last,a.next,a.previous');
		this.printer = $('.js-print');
		this.statusFilter = $('.attendees-filter li.js-attendee-status');
		
		var participants = this;
		
		this.activity = ccpd.tier2;
		
		this.updateRegistrants({
			page: ccpd.tier3.nPageNo, 
			status: ccpd.tier3.nStatus
		});
		
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
		
		this.pager.click(function() {
			participants.changePage();
		});
		
		this.printer.click(function() {
			participants.printDocument();
		});
		
		this.statusFilter.click(function() {
			participants.changeActiveAttendeeStatus();
		});
	},
	
	activity: [],
	
	changePage: function() {
		var $btnNext = $('.pager-simple a.next');
		var $btnPrev = $('.pager-simple a.previous');
		var $elem = $(this);
		var $pageSelector = $('.pageSelector');
		var pageURL = '/activity_participants/AHAH/' + this.activity.nActivity + '?status=0&page=';
		var pageNext;
		var pagePrev;
		
		this.activity.nPageNo = parseInt($.Mid(this.href,$.Find('page=',this.href)+5,$.Len(this.href)-$.Find('page=',this.href)+4));
		
		pageNext = (parseInt(this.activity.nPageNo)+1);
		pagePrev = (parseInt(this.activity.nPageNo)-1);
		
		if(this.activity.nPageNo >= 1 && this.activity.nPageNo <= this.activity.totalPages) {
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
			$pageSelector.text(this.activity.nPageNo);
			
			// UPDATE COOKIE FOR CURRENT ACTIVITY PAGE NUMBER
			$.post("/UserSettings/setAttendeePage", { ActivityID: this.activity.nActivity, Page: this.activity.nPageNo });
			
			// RELOAD DATA
			this.updateRegistrants(this.activity.nPageNo, this.activity.nStatus);
		}
	},
	
	changeActiveAttendeeStatus: function() {
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
				countContainer.html('(' + eval('status' +  status + 'Count') + ')');
			}
		});
	},
	
	updatePagesDropdown: function() {
		var pagesContainer = $('.pages');
		var pageSelector = $('.pageSelector');
		
		// CLEAR CURRENT PAGES LIST
		pagesContainer.children().remove();
		
		// CREATE NEW PAGES LIST
		for(var i=1; i<=ccpd.tier3.totalPages; i++) {
			var pageLink = $('<a />').addClass('page').attr('href','/activity_participants/AHAH/' + this.activity.nActivity + '?status=' + ccpd.tier3.nStatus + '&page=' + i).text(i);
			var page = $('<li />').append(pageLink).appendTo(pagesContainer);
		}
		
		// UPDATE CURRENT PAGE NUMBER
		pageSelector.text(ccpd.tier3.nPageNo);
		
		// DETERMINE IF NEXT/PREVIOUS PAGING BUTTONS NEED DISABLED
		if(ccpd.tier3.nPageNo == 1) $('a.previous').addClass('disabled');
		if(ccpd.tier3.nPageNo >= ccpd.tier3.totalPages) $('a.next').addClass('disabled');
	},
	
	updateRegistrants: function(params) {
		var page;
		var status;
		
		if(typeof params == 'object' && typeof params.page == 'number') {
			page = params.page;
		} else {
			page = this.activity.nPageNo;
		}
		if(typeof params == 'object' && typeof params.status == 'number') {
			status = params.status;
		} else {
			status = this.activity.nStatus;
		}
		
		$.ajax({
			url: '/activity_participants/ahah', 
			type: 'get',
			data: { key: this.activity.nActivity, status: status, selectedAttendees: ccpd.tier3.selectedRows, page: page  },
			success: function(data) {
				var activeStatusCheckMark = $('<i/>').addClass('icon-ok active-status js-active-status');
				ccpd.tier3.container = $('.js-registrants-container');
				ccpd.tier3.loader = $('.js-registrants-loading');
				
				ccpd.tier3.container.html(data);
				ccpd.tier3.loader.hide();
				
				$(".js-all-attendee").unbind();
				
				// PLACE CHECKMARK BY ACTIVE STATUS
				$('.js-active-status').remove();
				$('.js-attendee-status-' + status).find('a').prepend(activeStatusCheckMark);
				
				// REPLACE ACTIVE STATUS TITLE
				$('.js-attendee-status-title').text($('.js-attendee-status-' + status).find('a span.js-attendee-status-name').text());
				
				// CHECK IF ALL VIEWABLE ATTENDEES ARE SELECTED
				if($(".js-all-attendee").length == ccpd.tier3.TotalAttendeeCount && ccpd.tier3.selectedRows.split(',').length == ccpd.tier3.TotalAttendeeCount) {
					// CHECK THE CHECK ALL BOX
					$('.js-check-all').attr('checked', true);
				}
				
				// CHECK IF ATTENDEE HAS BEEN MARKED AS SELECTED	
				$(".js-all-attendee").each(function() {
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
		
		participant.defineParticipant();
		
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
	
	defineParticipant: function() {
		this.attendeeStatusViewChange = this.row.find('.js-view-attendee-statusdate');
		this.checkBox = this.row.find('.js-selected-checkbox');
		this.fakeAttendeeRemover = this.row.find('.js-delete-link');
		this.id = this.row.find('.attendeeId').val();
		this.personId = this.row.find('.personId').val();
		this.statusDateEditor = this.row.find('.js-edit-status-date');
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
