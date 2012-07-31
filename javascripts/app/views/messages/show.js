/*! ce.Views.Messages.ShowView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Messages",function(self,ce,Backbone,Marionette,$,_) {
	self.ShowView = Backbone.Marionette.ItemView.extend({
		template: 'messages/show',
	});
});
