/*! ce.Views.Participants.ShowView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Participants",function(self,ce,Backbone,Marionette,$,_) {
	self.ShowView = Backbone.Marionette.ItemView.extend({
		template: 'participants/show',
	});
});
