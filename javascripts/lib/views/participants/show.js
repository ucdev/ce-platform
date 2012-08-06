/*! ce.Views.Participants.ShowView extends Backbone.Marionette.ItemView */
ce.module("Views.Participants",function(self,ce,Backbone,Marionette,$,_) {
	self.ShowView = Backbone.Marionette.ItemView.extend({
		template: 'participants/show',
	});
});
