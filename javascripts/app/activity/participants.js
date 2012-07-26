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
		
		self.paginatorCollection = ce.Collections.Activity_participants.extend({
			
			server_api: {
				'$format': 'json',
				'activityId':ce.activity.Model.get('id'),
				'orderby': 'fullName',
				'$skip': function() { return this.totalPages * this.perPage }
			}
		});
		
		self.records = params.records;
		
		// CREATE COLLECTION
		self.collection = new self.paginatorCollection();
		
		// FILL COLLECTION
		//self.collection.add(params.records);
		
		// CREATE PAGE VIEW
		self.view = new self.List({
			collection: self.collection
		});
		
		// SHOW PAGE VIEW
		ce.subpage.show(self.view);
		self.trigger("page_loaded");
	};
});