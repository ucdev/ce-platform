ce.module("activity.participants",function(self,ce,Backbone,Marionette,$,_) {
	self.Row = Backbone.Marionette.ItemView.extend({
		el: '.js-attendee-rows',
		template:'activity_participants-row',
		tagName:'tr',
		
		className:'attendeeRow',
		onRender: function() {
			var _data = this.serializeData()
			var _temp = this.getTemplate();
			var _html = Marionette.Renderer.render(_temp, _data);
			console.log(_html);
			//this.$el.append(_html);
		}
	});
	
	self.List = Backbone.Marionette.CompositeView.extend({
		el: '.js-registrants-container',
		tagName: 'table',
		itemView: self.Row,
		id:'RegistrantsContainer',
		className: 'table-striped table-bordered',
		template: 'activity_participants-table'
	});
	
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
		
		self.filter = new self.Filter();
		self.pager = new ce.ui.Pager();
		
		ce.subpage.show(self.CompositeView);
		self.trigger("page_loaded");
	};
});