/*! ce.Views.Activities.EditView extends Backbone.Marionette.ItemView */
ce.module("Views.Activities",function(self,ce,Backbone,Marionette,$,_) {
	self.EditView = Backbone.Marionette.ItemView.extend({
		template: 'activities/edit',
	});
});
