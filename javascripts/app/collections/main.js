/*! ce.Collections.Main extends Backbone.Collection */
ce.module("Collections",function(self,ce,Backbone,Marionette,$,_) {
	self.Main = Backbone.Collection.extend({
		url: '/api/main',
		model: ce.Models.Main
	});
});
