/*! ce.Collections.Assets extends Backbone.Collection */
ce.module("Collections",function(self,ce,Backbone,Marionette,$,_) {
	self.Assets = Backbone.Collection.extend({
		url: '/api/assets',
		model: ce.Models.Asset
	});
});
