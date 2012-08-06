/*! ce.Views.Assets.EditView extends Backbone.Marionette.ItemView */
ce.module("Views.Assets",function(self,ce,Backbone,Marionette,$,_) {
	self.EditView = Backbone.Marionette.ItemView.extend({
		template: 'assets/edit',
	});
});
