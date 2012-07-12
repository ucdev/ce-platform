/*! ce.Views.Activity_participants.EditView extends Backbone.Marionette.ItemView */
ce.module("Views.Activity_participants",function(self,ce,Backbone,Marionette,$,_) {
	self.EditView = Backbone.Marionette.ItemView.extend({
		template: 'activity_participants/edit',
	});
});
