/*! ce.Collections.Activity_participants extends Backbone.Collection */
ce.module("Collections",function(self,ce,Backbone,Marionette,$,_) {
	self.Activity_participants = Backbone.Collection.extend({
		url: '/api/activity_participants',
		model: ce.Models.Activity_participant
	});
});
