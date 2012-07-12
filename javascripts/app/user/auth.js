/*! ce.user.auth @description: logs when user events */
ce.module("user",function(self,ce,Backbone,Marionette,$,_) {
	//LOGIN CHECK
	self.isLoggedIn = function() {
		if(self.model.get('loggedIn')) {
			self.trigger("loggedIn");
			
			return true;
		} else {
			
			return false;
		}
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