/*! ce.user.events @description: logs when user events */
ce.module("activity.credit_requests",{
	startWithApp:false,
	define:function(self,ce,Backbone,Marionette,$,_) {
		self.on("loaded",function() {
			ce.log.info("credit_requests: loaded");
		});
	}
});