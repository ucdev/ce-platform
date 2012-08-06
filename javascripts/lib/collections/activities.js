/*! ce.Collections.Activities extends Backbone.Collection */
ce.module("Collections",function(self,ce,Backbone,Marionette,$,_) {
	self.Activities = Backbone.Collection.extend({
		url: '/api/activities',
		model: ce.Models.Activity
	});
});
