/*! ce.Views.Edit.ShowView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Edit",function(self,ce,Backbone,Marionette,$,_) {
	self.ShowView = Backbone.Marionette.ItemView.extend({
		template: 'edit/show',
	});
});
