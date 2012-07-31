/*! ce.Views.Main.ShowView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Main",function(self,ce,Backbone,Marionette,$,_) {
	self.ShowView = Backbone.Marionette.ItemView.extend({
		template: 'main/show',
	});
});
