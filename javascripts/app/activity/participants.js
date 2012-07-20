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
		
		self.View = new self.IndexView();
 
		//console.dir(self.View);
		self.loadRegistrants();
		
		self.on('participants_loaded', function() {
			self.Collection = new ce.Collections.Activity_participants({
				collection: self.rows,
				el: '.js-participants-table'
			});
			
			self.Collection.render();
		});
	};
});