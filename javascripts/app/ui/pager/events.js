ce.module("ui",function(self,ce,Backbone,Marionette,$,_){
	self.on("pager_loaded",function() {
		ce.log.info('pager: loaded');
	});
	
	self.on("pager_next",function() {
		ce.log.info('pager: next page loaded');
	});
	
	self.on("pager_prev",function() {
		ce.log.info('pager: previous page loaded');
	});
	
	self.on("pager_page_selected",function() {
		ce.log.info('pager: page ' + self.collection.currentPage + ' loaded');
	});
});