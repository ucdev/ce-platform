/*! ce.Views.People.EditView extends Backbone.Marionette.ItemView */
ce.module("Views.People",function(self,ce,Backbone,Marionette,$,_) {
	self.EditView = Backbone.Marionette.ItemView.extend({
		template: 'people/edit',
	});
});
