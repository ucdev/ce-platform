/*! ce.Views.Messages.EditView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Messages",function(self,ce,Backbone,Marionette,$,_) {
	self.EditView = Backbone.Marionette.ItemView.extend({
		template: 'messages/edit',
	});
});
