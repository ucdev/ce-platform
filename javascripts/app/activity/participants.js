ce.module("activity.participants",function(self,ce,Backbone,Marionette,$,_) {
	self.load = function(params) {
		self.details = {
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
		
		self.records = params.records;
		
		// CREATE COLLECTION
		self.collection = new ce.Collections.Activity_participants(params.records);
		
		self.CompositeView = new self.List({
			collection: self.collection
		});
		
		ce.subpage.show(self.CompositeView);
		self.trigger("page_loaded");
	};
});