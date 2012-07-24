/*! ce.user.auth @description: logs when user events */
ce.module("user",{
	startWithApp:false,
	define:function(self,ce,Backbone,Marionette,$,_) {
		//LOGIN CHECK
		self.isLoggedIn = function() {
			if(self.model.get('loggedIn')) {
				self.trigger("loggedIn");
				
				return true;
			} else {
				
				return false;
			}
		}
		
		
		self.loginView = Backbone.View.extend({
			tagName: "div",
			
			className: "",
			
			
			render: function() {
				var view = this;
				$.ajax({
					url:'/login',
					type:'post',
					success:function(data) {
						$(view.el).html(data);
						return this;
					}
				});
			}
		});
		
		//LOGIN FUNCTION
		self.login = function(params) {
			var view = new self.loginView();
			ce.dialog.show(view);
			self.trigger("loggedIn");
		}
		
		//LOGOUT FUNCTION
		self.logout = function(params) {
			self.trigger("loggedOut");
		}
	}
});