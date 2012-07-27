ce.module("activity.participants",function(self,ce,Backbone,Marionette,$,_) {
	self.on("filter_loaded",function() {
		ce.log.info('participants: filter loaded');
	});
	
	self.on("participants_loaded",function() {
		ce.log.info('participants: loaded');
	});
	
	self.on("page_loaded",function() {
		ce.log.info('participants: page ready');
	});
});