/*! ce.activity.credit_requests @description: logs when credit request events */
ce.module("activity.credit_requests",function(self,ce,Backbone,Marionette,$,_) {
	
	self.load = function(params) {
		self.records = params.records;
		self.collection = new ce.Collections.Credit_requests(params.records);
		self.collection.fetch();
		self.trigger("loaded");
	}
});