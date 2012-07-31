/*! ce.Views.Activity_participants.ShowView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Activity_participants",function(self,ce,Backbone,Marionette,$,_) {
	self.ShowView = Backbone.Marionette.ItemView.extend({
		template: 'activity_participants/show',
	});
});
