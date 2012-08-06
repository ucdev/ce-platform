ce.module("activity.participants",function(self,ce,Backbone,Marionette,$,_) {
	self.load = function(params) {
		self.details = {
			activityId: ce.activity.Model.get('id'),
			AddlAttendees: params.legacy.AddlAttendees,
			currAttendee: params.legacy.currAttendee,
			currPerson: params.legacy.currPerson,
			MaxRegistrants: params.legacy.MaxRegistrants,
			NoChange: params.legacy.NoChange,
			nPageNo: params.legacy.nPageNo,
			nStatus: params.legacy.nStatus,
			selectedRows: params.legacy.selectedRows,
			selectedCount: params.legacy.selectedCount,
			totalAttendeeList: params.legacy.totalAttendeeList,
			rowsPerPage: params.legacy.rowsPerPage,
			totalPages: params.legacy.totalPages
		};
		
		// MODIFY CLIENT PAGER
		self.paginatorCollection = ce.Collections.Activity_participants.extend({
			server_api: {
				'$format': 'json',
				'activityId':ce.activity.Model.get('id'),
				'orderby': 'fullName',
				'$skip': function() { return this.totalPages * this.perPage }
			}
		});
		
		// CREATE COLLECTION
		self.collection = new self.paginatorCollection().add(params.records);
		self.collection.pager();
		
		self.topbar = new self.Topbar().render();
		
		// BUILD PAGE VIEW AND RENDER IT
		self.list = new self.List({
			el: $('.content-container'),
			collection: self.collection
		}).render();
		
		// BUILD PAGER
		self.pager = new ce.ui.Pager({
			el: $('.js-pager-container'),
			collection: self.collection
		}).render();
		
		//console.dir(self.list);
		//console.dir(self.collection);
		
		self.trigger("page_loaded");
	};
});