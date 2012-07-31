/*! ce.user @description: represents the current user */
ce.pkg("user",function(self,ce,Backbone,Marionette,$,_) {
	self.Model = ce.Models.Person.extend({});
	
	
	self.load = function(params) {
		self.model = new self.Model(params);
		
		self.trigger("loaded");
	}
	
	
	$(function() {
		$(".loginLink").click(function(ev) {
			self.login({});
			
			return false;
		});
	});
});