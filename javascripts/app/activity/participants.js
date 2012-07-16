ce.module("activity.participants",function(self,ce,Backbone,Marionette,$,_) {
	self.IndexView = Backbone.Marionette.CompositeView.extend({
		tagName: 'js-participants-table',
		itemView: self.RowView,
		template: 'activity_participants/index',
		
		initialEvents: function() {
			self.Collection = new ce.Collections.Activity_participants(self.data);
		},
		
		events: {
			'click .js-remove-attendees': 'removeAttendees',
			'click .js-status-filtered': '',
			'click .js-clear-attendee-search': 'clearAttendeeSearch',
			'keyup .js-attendee-search': '',
			'click .js-attendee-search-typeahead': 'searchAttendeeList',
			'click .js-status-Selected': 'viewSelectedRows',
			'click .js-change-status': 'updateAttendeeStatuses',
			'click .js-pager-simple': '',
			'click .js-page-selector': '',
			'click .js-next-page': 'nextPage',
			'click .js-page': 'selectPage',
			'click .js-pages': '',
			'click .js-prev-page': 'prevPage',
			'click .js-print': 'printDocument',
			'click .js-attendees-filter li.js-attendee-status': 'changeActiveAttendeeStatus',
			'click .js-attendee-rows': '',
			'click .js-check-all': 'selectAllAttendees'
		},
		
		changeActiveAttendeeStatus: function() {
			var statusLink = $(this).find('a');
			var countContainer = $(this).find('span');
			var participants = this;
			
			// UPDATE THE CURRENT STATUS
			participants.pageData.nStatus = this.id.replace('status','');
			
			this.contentContainer.html('');
			
			// UPDATE THE ATTENDEE STATUS COOKIE FOR CURRENT ACTIVITY
			$.ajax({
				url: "/UserSettings/setAttendeeStatus", 
				type: 'post',
				data: { ActivityID: ce.activity.Model.get("id"), status: this.pageData.nStatus },
				success: function(data) {
					participants.pageData.nPageNo = 1;
					
					participants.updatePaginator();
					
					participants.changePage();
				}
			});
		},
	
		changePage: function() {
			var attendeeList = this.attendeeList.statuses[this.pageData.nStatus].attendees;
			var attendeePlaceholder = this.contentContainer;
			var checkAll = this.checkAll;
			var attendeesToLoad = this.pageData.rowsPerPage*this.pageData.nPageNo;
			
			if(this.pageData.nPageNo >= 1 && this.pageData.nPageNo <= this.pageData.totalPages) {
				// DETERMINE IF PAGER BUTTONS NEED DISABLED
				if(this.pageData.nPageNo < this.pageData.totalPages) {
					this.pager['next'].removeClass('disabled');
				} else {
					this.pager['next'].addClass('disabled');
				}
				if(this.pageData.nPageNo > 1) {
					this.pager['prev'].removeClass('disabled');
				} else {
					this.pager['prev'].addClass('disabled');
				}
			
				// UPDATE SIMPLE PAGER DROPDOWN LABEL
				this.pager['label'].text(this.pageData.nPageNo);
				
				// UPDATE COOKIE FOR CURRENT ACTIVITY PAGE NUMBER
				$.post("/UserSettings/setAttendeePage", { ActivityID: ce.activity.Model.get("id"), Page: this.pageData.nPageNo });
				
				// UPDATE STATUS FILTER TEXT LABEL
				$('.js-attendee-status-title').text(this.attendeeList.statuses[this.pageData.nStatus].name);
				
				// CLEAR THE OLD ATTENDEE LIST
				$('.js-all-attendee').detach('');
				
				// LOAD ATTENDEE DATA
				for(var i = attendeesToLoad-this.pageData.rowsPerPage; i < attendeesToLoad; i++) {
					// PREVENT ANY BAD DATA FROM BEING ADDED TO THE DOM
					if(typeof attendeeList[i] != 'undefined') {
						var attendee = this.pageData.rows[attendeeList[i]];
						
						if(typeof attendee != 'undefined') {
							attendee['row'].appendTo(attendeePlaceholder);
						}
						
						// PROVIDE PARTICIPANT ROW FUNCTIONALITY
						//attendee = new ccpd.activity_participants.participant({ $elem: attendee['row'] });
					}
				}
				
				// DETERMINE IF ALL OF THE CURRENT ATTENDEES ARE SELECTED
				if($('.js-selected-checkbox').filter(':checked').length == 15) {
					// MARK THE CHECKALL CHECKBOX CHECKED
					checkAll.attr('checked', true);
				} else {
					// UNCHECK THE CHECKALL CHECKBOX
					checkAll.attr('checked', false);
				}
			} else {
				// UPDATE STATUS FILTER TEXT LABEL
				$('.js-attendee-status-title').text(this.attendeeList.statuses[this.pageData.nStatus].name);
			}
		},
		 
		clearAttendeeSearch: function() {
			// SHOW ALL ATTENDESS
			participants.pageData.nStatus = 0;
			
			// RELOAD PAGE DATA
			participants.changePage();
			
			// CLEAR FILTER TEXT FIELD AND HIDE THE CLEAR DIV
			participants.attendeeSearch['input'].val('');
			participants.attendeeSearch['clear'].hide();
				
		},
		
		getParticipants: function() {
			var attendeesList = this.attendeeList;
			var participants = this;
			
			$.ajax({
				url: '/activity_participants/loadData',
				type: 'post',
				data: { key: ce.activity.Model.get("id") },
				dataType: 'json',
				async: true,
				success: function(data) {
					attendeesList.attendees = data.DATASET;
					participants.pageData.rows = data.PAYLOAD;
					
					$.each(participants.pageData.rows, function(i, item) {
						this.data['completeDate'] = formatDate(this.data['completeDate']);
						this.data['created'] = formatDate(this.data['created']);
						this.data['currStatusDate'] = formatDate(this.data['currStatusDate']);
						this.data['registerDate'] = formatDate(this.data['registerDate']);
						this.data['startDate'] = formatDate(this.data['startDate']);
						this.data['termDate'] = formatDate(this.data['termDate']);
						this.data['updated'] = formatDate(this.data['updated']);
					});
					
					// FORMATS THE DATE AND RETURNS IT AS MM/DD/YYYY
					function formatDate(date) {
						var dateSplit = date.split('T')[0].split('-');
						var dateParts = {
							'year': dateSplit[0],
							'month': dateSplit[1],
							'day': dateSplit[2]
						};
						
						return dateParts['month'] + '/' + dateParts['day'] + '/' + dateParts['year'];
					}
					
					$('body').trigger('data_loaded');
				}
			});
		},
		
		loadRegistrants: function() {
			var page;
			var participants = this;
			var status;
			var attendeesList = this.attendeeList;
			var attendeesStatusList;
			
			$('body').on('data_loaded', function() {
				// CREATE THE STATUS ARRAY
				attendeesStatusList = participants.attendeeList['statuses'] = { 
																	0: { 'name': 'All', 'attendees': [] }, 
																	1: { 'name': 'Complete', 'attendees': [] }, 
																	2: { 'name': 'In Progress', 'attendees': [] }, 
																	3: { 'name': 'Registered', 'attendees': [] }, 
																	4: { 'name': 'Failed', 'attendees': [] }, 
																	'selected': { 'name': 'Selected', 'attendees': [] },
																	'filtered': { 'name': 'Filtered', 'attendees': [] } };
				
				// CREATE EACH PARTICIPANT ROW
				$.each(participants.pageData.rows, function(id, item) {
					var data = item.data;
					
					// ADD ATTENDEE TO THE 'ALL ATTENDEES' LIST
					attendeesStatusList[0]['attendees'].push(id);
					
					// ADD ATTENDEE TO THEIR ATTENDEE STATUS LIST
					attendeesStatusList[data.statusId]['attendees'].push(id);
					
					// SET STATUS BOOLEAN FOR TEMPLATE PURPOSES
					data['isStatus' + data.statusId] = true;
					
					// PROVIDE PARTICIPANT ROW LOGIC TO CURRENT ATTENDEE
					ccpd.tier3.rows[id] = new ccpd.activity_participants.participant({ data: data });
				});
																
				// UPDATE ATTENDEE STATUS FILTER COUNTS
				participants.updateFilterCounts();
				
				// UPDATE THE PAGINATION FEATURE TO MATCH THE TOTAL PAGES FOR CURRENT ATTENDEE LIST STATUS
				participants.updatePaginator();
				
				// UPDATE VIEWABLE ATTENDEE ROWS
				participants.changePage();
			});
			
			this.getParticipants();
		},
		
		nextPage: function() {
			if(participants.pageData.nPageNo+1 <= participants.pageData.totalPages) {
				participants.pageData.nPageNo += 1
											  
				participants.changePage();
			}
		},
		
		prevPage: function() {
			if(participants.pageData.nPageNo-1 >= 1) {
				participants.pageData.nPageNo -= 1
											  
				participants.changePage();
			}
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
		
		searchAttendeelist: function() {
			var input = $(this);
			var statusList = participants.attendeeList.statuses['filtered'].attendees;
			
			// DETERMINE IF THE CLEAR FILTER DIV IS SHOWN OR HIDDEN
			if(input.val().length > 0) {
				participants.attendeeSearch.clear.show();
			} else {
				participants.attendeeSearch.clear.hide();
			}
			
			// CLEAR CURRENT FILTER DOM ATTENDEE LIST
			statusList.length = 0;
			
			// CLEAR CURRENT ATTENDEE HTML LIST
			participants.contentContainer.html('');
			
			// DETERMINE IF SEARCH FILTER IS BLANK
			if(input.val().length > 0) {
				// LOOP OVER ATTENDEES
				$.each(participants.attendeeList['attendees'], function(i, item) {
					// SEE IF THE FIRST OR LAST NAME STARTS WITH THE SEARCH VALUE AND THAT TEHY ARE NOT ALREADY IN THE FILTER STATUS LIST
					if((item.FIRSTNAME.startsWith(input.val()) || item.LASTNAME.startsWith(input.val())) && !$.ListFind(statusList, item.ATTENDEEID)) {
						statusList.push(item.ATTENDEEID);
					}
				});
				
				// SET CURRENT STATUS TO FILTERED
				participants.pageData.nStatus = 'filtered';
				
				// UPDATE PAGINATOR AND RELOAD HTML
				participants.updatePaginator();
				participants.changePage();
			}
		},
		
		selectAllAttendees: function() {
			var checkAll = false;
			
			if($(this).attr('checked')) {
				checkAll = true;
			}
			
			participants.selectAllAttendees({
				checkStatus: checkAll
			});
		},
		
		selectPage: function() {
			participants.pageData.nPageNo = $(this).text();
			
			participants.changePage();
		}
	});
});