/*! ce.Views.Activity_participants.RowView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Activity_participants",function(self,ce,Backbone,Marionette,$,_) {
	self.RowView = Backbone.Marionette.ItemView.extend({
		tagName: 'tr',
	
		template: 'activity_participants/row',
		
		events: {
			'click .destroy': 'destroy',
			'click .edit': 'edit'
		},
		
		// delete: activity_participant
		destroy:function() {
			
		},
		
		// edit: activity_participant
		edit:function() {
			
		}
	});
});
