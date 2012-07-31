/*! ce.Views.Assets.EditView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Assets",function(self,ce,Backbone,Marionette,$,_) {
	self.EditView = Backbone.Marionette.ItemView.extend({
		template: 'assets/edit',
	});
});
