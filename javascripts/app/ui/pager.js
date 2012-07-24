ce.module("ui",function(self,ce,Backbone,Marionette,$,_){
	self.Pager = Backbone.Marionette.ItemView.extend({
		template: 'activity_participants-pager',
        initialize: function(){
            this.render();
        },
		
		el: '.js-ui-pager',
		
		events: {
			'click .js-next-page': 'nextPage',
			'click .js-page': 'selectPage',
			'click .js-prev-page': 'prevPage'
		},
		
		render: function() {
			var _data = { page_no: 1 };
			var _temp = Marionette.Renderer.render(this.getTemplate());
			var _tempRendered = _.template(_temp, _data);
			
			this.$el.html(_tempRendered);
			
			self.trigger('pager_loaded');
		},
		
		nextPage: function() {
			ce.log.info('pager: next page loaded');
			/*if(participants.pageData.nPageNo+1 <= participants.pageData.totalPages) {
				participants.pageData.nPageNo += 1
											  
				participants.changePage();
			}*/
		},
		
		prevPage: function() {
			ce.log.info('pager: previous page loaded');
			/*if(participants.pageData.nPageNo-1 >= 1) {
				participants.pageData.nPageNo -= 1
											  
				participants.changePage();
			}*/
		},
		
		selectPage: function() {
			participants.pageData.nPageNo = $(this).text();
			
			participants.changePage();
		}
	});
	
	self.changePage = function() {
		var attendeeList = this.attendeeList.statuses[self.details.nStatus].attendees;
		var attendeePlaceholder = this.contentContainer;
		var checkAll = this.checkAll;
		var attendeesToLoad = self.details.rowsPerPage*self.details.nPageNo;
		
		if(self.details.nPageNo >= 1 && self.details.nPageNo <= self.details.totalPages) {
			// DETERMINE IF PAGER BUTTONS NEED DISABLED
			if(self.details.nPageNo < self.details.totalPages) {
				this.pager['next'].removeClass('disabled');
			} else {
				this.pager['next'].addClass('disabled');
			}
			if(self.details.nPageNo > 1) {
				this.pager['prev'].removeClass('disabled');
			} else {
				this.pager['prev'].addClass('disabled');
			}
		
			// UPDATE SIMPLE PAGER DROPDOWN LABEL
			this.pager['label'].text(self.details.nPageNo);
			
			// UPDATE COOKIE FOR CURRENT ACTIVITY PAGE NUMBER
			$.post("/UserSettings/setAttendeePage", { ActivityID: ce.activity.Model.get('id'), Page: self.details.nPageNo });
			
			// UPDATE STATUS FILTER TEXT LABEL
			$('.js-attendee-status-title').text(this.attendeeList.statuses[self.details.nStatus].name);
			
			// CLEAR THE OLD ATTENDEE LIST
			$('.js-all-attendee').detach('');
			
			// LOAD ATTENDEE DATA
			for(var i = attendeesToLoad-self.details.rowsPerPage; i < attendeesToLoad; i++) {
				// PREVENT ANY BAD DATA FROM BEING ADDED TO THE DOM
				if(typeof attendeeList[i] != 'undefined') {
					var attendee = self.details.rows[attendeeList[i]];
					
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
			$('.js-attendee-status-title').text(this.attendeeList.statuses[self.details.nStatus].name);
		}
	};
	
	self.updatePaginator = function() {
		self.details.totalPages = Math.ceil(self.details.totalAttendeeList.statuses[self.details.nStatus].attendees.length/self.details.rowsPerPage);
		
		// CLEAR CURRENT PAGES LIST
		self.details.pager['list'].children().remove();
		
		// CREATE NEW PAGES LIST
		for(var i=1; i<=self.details.totalPages; i++) {
			var pageLink = $('<a />').addClass('js-page').text(i);
			var page = $('<li />').append(pageLink).appendTo(self.details.pager['list']);
		}
		
		// UPDATE CURRENT PAGE NUMBER
		self.details.pager['label'].text(self.details.nPageNo);
		
		// DETERMINE IF NEXT/PREVIOUS PAGING BUTTONS NEED DISABLED
		if(self.details.nPageNo == 1) this.pager['prev'].addClass('disabled');
		if(self.details.nPageNo >= self.details.totalPages) this.pager['next'].addClass('disabled');
		
		this.pager['page'] = $('.js-page');
	};
});