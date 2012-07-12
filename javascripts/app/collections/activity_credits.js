/*! ce.Collections.Activity_credits extends Backbone.Collection */
ce.module("Collections",function(self,ce,Backbone,Marionette,$,_) {
	self.Activity_credits = Backbone.Collection.extend({
		url: '/api/activity_credits',
		model: ce.Models.Activity_credit
	});
});
