/*! ce.activity.credit_requests @description: logs when credit request events */
ce.module("activity.credit_requests",function(self,ce,Backbone,Marionette,$,_) {
	
	self.load = function(params) {
		self.records = params.records;
		self.Data = ce.Collections.credit_requests;
	}
	
	self.getData = function(params) {
			
	}
	
	//LOGIN FUNCTION
	self.login = function(params) {
		
		self.trigger("loggedIn");
	}
	
	//LOGOUT FUNCTION
	self.logout = function(params) {
		self.trigger("loggedOut");
	}
});