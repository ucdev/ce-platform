/*! ce.Collections.Activity_cdc extends Backbone.Collection */
ce.pkg("Collections",function(self,ce,Backbone,Marionette,$,_) {
	self.Activity_cdc = Backbone.Collection.extend({
		url: '/api/activity_cdc',
		model: ce.Models.Activity_cdc
	});
});
