/*! ce.Views.Activity_cdc.ShowView extends Backbone.Marionette.ItemView */
ce.module("Views.Activity_cdc",function(self,ce,Backbone,Marionette,$,_) {
	self.ShowView = Backbone.Marionette.ItemView.extend({
		template: 'activity_cdc/show',
	});
});
