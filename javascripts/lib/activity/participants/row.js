ce.module("activity.participants",function(self,ce,Backbone,Marionette,$,_) {
	self.Row = Backbone.Marionette.ItemView.extend({
		tagName: 'tr',
		className:'personRow AllAttendees js-all-attendee',
		template:'activity_participants-row'
	});
});