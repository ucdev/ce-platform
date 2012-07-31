/*! ce.Collections.People extends Backbone.Collection */
ce.pkg("Collections",function(self,ce,Backbone,Marionette,$,_) {
	self.People = Backbone.Collection.extend({
		url: '/api/people',
		model: ce.Models.Person
	});
});
