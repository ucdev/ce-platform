/*! ce.Collections.Credit_requests extends Backbone.Collection */
ce.module("Collections",function(self,ce,Backbone,Marionette,$,_) {
	self.Credit_requests = Backbone.Collection.extend({
		url: '/api/credit_requests',
		model: ce.Models.Credit_request
	});
});
