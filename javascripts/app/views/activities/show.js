/*! ce.Views.Activities.ShowView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Activities",function(self,ce,Backbone,Marionette,$,_) {
	self.ShowView = Backbone.Marionette.ItemView.extend({
		template: 'activities/show',
	});
});
