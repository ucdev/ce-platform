/*! ce.Views.Assets.ShowView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Assets",function(self,ce,Backbone,Marionette,$,_) {
	self.ShowView = Backbone.Marionette.ItemView.extend({
		template: 'assets/show',
	});
});
