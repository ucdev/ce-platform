/*! ce.Collections.Assets extends Backbone.Collection */
ce.pkg("Collections",function(self,ce,Backbone,Marionette,$,_) {
	self.Assets = Backbone.Collection.extend({
		url: '/api/assets',
		model: ce.Models.Asset
	});
});
