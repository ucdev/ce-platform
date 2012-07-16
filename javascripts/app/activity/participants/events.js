ce.module("activity.participants",function(self,ce,Backbone,Marionette,$,_) {
	self.on("participants_loaded",function() {
		ce.log.info("participants: loaded");
	});
});