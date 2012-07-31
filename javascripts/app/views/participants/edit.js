/*! ce.Views.Participants.EditView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Participants",function(self,ce,Backbone,Marionette,$,_) {
	self.EditView = Backbone.Marionette.ItemView.extend({
		template: 'participants/edit',
	});
});
