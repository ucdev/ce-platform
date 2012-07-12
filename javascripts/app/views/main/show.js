/*! ce.Views.Main.ShowView extends Backbone.Marionette.ItemView */
ce.module("Views.Main",function(self,ce,Backbone,Marionette,$,_) {
	self.ShowView = Backbone.Marionette.ItemView.extend({
		template: 'main/show',
	});
});
