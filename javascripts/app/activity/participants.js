ce.module("activity.participants",function(self,ce,Backbone,Marionette,$,_) {
	self.Row = Backbone.Marionette.ItemView.extend({
		tagName: 'tr',
		className:'personRow AllAttendees js-all-attendee'
	});
	
	self.List = Backbone.Marionette.CompositeView.extend({
		tagName: 'div',
		template: 'activity_participants-table',
		className: 'activity_participants-page',
		itemView: self.Row,
		appendHtml: function(collectionView, itemView) {
			var _tmpl = ce.templates.get('activity_participants-row');
			var _data = itemView.model.attributes;
			//_tmpl = _tmpl.replace(/&lt;/g,'<').replace(/&gt;/g,'>');
			var _cmpl = _.template(_tmpl, _data);
			
			var row = collectionView.$('tbody').append(_cmpl)
									.attr({
										  'id': 'attendeeRow-' + itemView.model.get('ATTENDEEID'),
										  'rel': '#PersonOptions' + itemView.model.get('PERSONID')
									});
									
			if(itemView.model.get('ISDELETED')) {
				row.addClass('personDeleted');
			}
		}
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
		
		ce.subpage.show(self.CompositeView);
		self.trigger("page_loaded");
	};
});

ce.activity.participants.start();