/*! ce.Views.Activity_participants.IndexView extends Backbone.Marionette.CompositeView */
ce.module("activity.participants",function(self,ce,Backbone,Marionette,$,_) {
	self.IndexView = Backbone.Marionette.CompositeView.extend({
		tagName: 'js-participants-table',
		itemView: self.RowView,
		template: 'activity_participants/index',
		
		constructor: function() {
			self.filter = new self.Filter();
			self.pager = new Pager();
		},
		
		events: {
			'click .js-remove-attendees': 'removeAttendees',
			'click .js-status-Selected': 'viewSelectedRows',
			'click .js-change-status': 'updateAttendeeStatuses',
			'click .js-print': 'printDocument',
			'click .js-check-all': 'monitorCheckAll'
		},
		
		monitorCheckAll: function() {
			var checkAll = false;
			
			if($(this).attr('checked')) {
				checkAll = true;
			}
			
			participants.selectAllAttendees({
				checkStatus: checkAll
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
					// DETERMINE IF THERE ARE ATTENDEES SELECTED
					if(SelectedAttendees.length > 0) {			
						window.open("/report/CNECert?ActivityID=" + nActivity + "&ReportID=6&selectedAttendees=" + SelectedAttendees);
					} else {
						window.open("/report/CNECert?ActivityID=" + nActivity + "&ReportID=6");
					}
					break;
			}
		},
		
		removeAttendees: function() {
			var participants = this;
			
			// DETERMINE IF THERE ARE ATTENDEES SELECTED
			if(self.details.selectedRows.length > 0) {
				// DETERMINE IF THE USER MEANS TO REMOVE SELECTED ATTENDEES
				if(confirm("Are you sure you want to remove the checked attendees from this activity?")) {
					$.ajax({
						url: '/AJAX_adm_Activity/removeCheckedAttendees', 
						type: 'post',
						data: { AttendeeList: self.details.selectedRows, ActivityID: participants.activity.nActivity },
						dataType: 'json',
						success: function(data) {
							if(data.STATUS) {
								addMessage(data.STATUSMSG,250,6000,4000);
								
								// LOOP OVER SELECTED ATTENDEE IDs
								$.each(ccpd.tier3.totalAttendeeList.statuses['selected'].attendees, function(i, item) {
									var attendeeId = item;
									
									// REMOVE CURRENT ATTENDEEID FROM STATUS LISTS
									participants.cleanStatusArrays({
										'id': attendeeId
									});
									
									// REMOVE CURRENT ATTENDEE DOM OBJECT
									participants.pageData.rows[attendeeId].removeAttendee();
								});
									   
								participants.pageData.selectedCount = 0;
								participants.pageData.selectedRows = '';
								$('.js-attendee-status-selected-count').text(0);
								$("#CheckedCount").html("(0)");
								
								participants.changePage();
							} else {
								addError(data.STATUSMSG,250,6000,4000);
							}
						}
					});
				}
			} else {
				addError('You must select attendees to remove.',500,3000,2500);
			}
		},
		
		selectAllAttendees: function(params) {
			var participants = this;
			var selectAll = params.checkStatus;
			var attendeeList = this.attendeeList.statuses[self.details.nStatus].attendees;
			var attendeesToSelect = self.details.rowsPerPage*self.details.nPageNo;
			
			// LOOP OVER CURRENTLY VIEWABLE ATTENDEES
			for(var i = attendeesToSelect-15; i < attendeesToSelect; i++) {
				var participant = self.rows[attendeeList[i]];
				var row = participant.row;
				var checkBox = participant.checkBox;
				
				// DETERMINE IF THE DATA IS UNDEFINED
				if(typeof participant.id == 'string') {
					if(selectAll && !checkBox.is(':checked')) {
						// ADD CURRENT MEMBER TO SELECTEDMEMBERS LIST
						participant.addSelectedRow({
							person: participant.personId,
							attendee: participant.id
						});
						
						checkBox.attr("checked",true);
						
						// CHANGE BACKGROUND COLOR OF PERSONROW
						row.addClass('alert alert-info');
					} else if(!selectAll && checkBox.is(':checked')) {
						// ADD CURRENT MEMBER TO SELECTEDMEMBERS LIST
						participant.removeSelectedRow({
							person: participant.personId,
							attendee: participant.id
						});
						
						checkBox.attr("checked",false);
						
						// CHANGE BACKGROUND COLOR OF PERSONROW
						row.removeClass('alert alert-info');
					}
				}
			}
		},
		
		// UPDATE SELECTED ATTENDEES STATUSID
		updateAttendeeStatuses: function() {
			var participants = this;
			var updateToStatus = this.id.split('-')[2];
			
			$.ajax({
				url: "/AJAX_adm_Activity/updateAttendeeStatuses",
				type: 'post',
				data: { AttendeeList: self.details.selectedRows, ActivityID: this.activity.nActivity, StatusID: updateToStatus },
				dataType: 'json',
				success: function(data)  {
					if(data.STATUS) {
						addMessage(data.STATUSMSG,500,6000,4000);
						updateStats();
						clearSelectedMembers();
						
						participants.changePage();
					} else {
						addError(data.STATUSMSG,500,6000,4000);
					}
				}
			});
		},
		
		viewSelectedRows: function() {
			if(this.attendeeList.statuses['selected'].attendees.length > 0) {
				self.details.nPageNo = 1;
				self.details.nStatus = 'selected';
				
				this.updatePaginator();
				
				this.changePage()
			} else {
				addError('You must select participants first.',500,6000,4000);
			}
		}
	});
	
	self.updateFilterCounts = function() {
		$.each($('.js-attendees-filter').children(), function(i, item) {
			// DETERMINE IF CURRENT LIST ITEM IS A STATUS ROW
			if($(this).hasClass('js-attendee-status')) {
				var status = this.id.split('status')[1];
				var countContainer = $(this).find('span.js-attendee-status-count');
				
				// PROVIDE STATUS COUNT
				countContainer.html('(' + self.details.totalAttendeeList.statuses[status].attendees.length + ')');
			}
		});
	};
	
	self.on("participants_loaded",function() {
		ce.log.info("participants: loaded");
	});
});
