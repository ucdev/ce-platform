/*! ce.Views.People.ShowView extends Backbone.Marionette.ItemView */
ce.module("Views.People",function(self,ce,Backbone,Marionette,$,_) {
	self.ShowView = Backbone.Marionette.ItemView.extend({
		template: 'people/show',
	});
});
