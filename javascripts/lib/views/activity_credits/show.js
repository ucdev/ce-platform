/*! ce.Views.Activity_credits.ShowView extends Backbone.Marionette.ItemView */
ce.module("Views.Activity_credits",function(self,ce,Backbone,Marionette,$,_) {
	self.ShowView = Backbone.Marionette.ItemView.extend({
		template: 'activity_credits/show',
	});
});
