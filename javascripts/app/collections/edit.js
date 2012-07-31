/*! ce.Collections.Edit extends Backbone.Collection */
ce.pkg("Collections",function(self,ce,Backbone,Marionette,$,_) {
	self.Edit = Backbone.Collection.extend({
		url: '/api/edit',
		model: ce.Models.Edit
	});
});
