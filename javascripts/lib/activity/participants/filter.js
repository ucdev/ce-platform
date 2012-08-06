ce.module("activity.participants",function(self,ce,Backbone,Marionette,$,_){
	self.Filter = Backbone.Marionette.ItemView.extend({
		template: 'activity_participants-filter',
        initialize: function(){
            this.render();
        },
		
		el: '.js-attendee-filter',
		
		events: {
			'click .js-clear-attendee-search': 'clearAttendeeSearch',
			'click .js-attendee-search-typeahead': 'searchAttendeeList',
			'click .js-attendees-filter li.js-attendee-status': 'changeActiveAttendeeStatus'
		},
		
		render: function() {
			var _data = { };
			var _temp = this.getTemplate();
			var _html = Marionette.Renderer.render(_temp);
			
			this.$el.html(_html);
			
			self.trigger('filter_loaded');
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
				data: { ActivityID: ce.activity.Model.get("id"), status: self.details.nStatus },
				success: function(data) {
					participants.pageData.nPageNo = 1;
					
					participants.updatePaginator();
					
					participants.changePage();
				}
			});
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
		
		searchAttendeeList: function() {
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
		}
	});
});