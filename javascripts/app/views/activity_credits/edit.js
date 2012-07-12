/*! ce.Views.Activity_credits.EditView extends Backbone.Marionette.ItemView */
ce.module("Views.Activity_credits",function(self,ce,Backbone,Marionette,$,_) {
	self.EditView = Backbone.Marionette.ItemView.extend({
		template: 'activity_credits/edit',
	});
});
