/*! ce.user @description: represents the current user */
ce.module("user",function(self,ce,Backbone,Marionette,$,_) {
	self.Model = ce.Models.Person.extend({});
	
	
	self.load = function(params) {
		self.model = new self.Model(params);
		
		self.trigger("loaded");
	}
});