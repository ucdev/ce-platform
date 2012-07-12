/*! ce.Views.Participants.EditView extends Backbone.Marionette.ItemView */
ce.module("Views.Participants",function(self,ce,Backbone,Marionette,$,_) {
	self.EditView = Backbone.Marionette.ItemView.extend({
		template: 'participants/edit',
	});
});
