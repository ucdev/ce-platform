/*! ce.Views.Main.EditView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Main",function(self,ce,Backbone,Marionette,$,_) {
	self.EditView = Backbone.Marionette.ItemView.extend({
		template: 'main/edit',
	});
});
