/*! ce.Collections.Sessions extends Backbone.Collection */
ce.pkg("Collections",function(self,ce,Backbone,Marionette,$,_) {
	self.Sessions = Backbone.Collection.extend({
		url: '/api/sessions',
		model: ce.Models.Session
	});
});
