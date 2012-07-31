/*! ce.Views.Participants.RowView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Participants",function(self,ce,Backbone,Marionette,$,_) {
	self.RowView = Backbone.Marionette.ItemView.extend({
		tagName: 'tr',
	
		template: 'participants/row',
		
		events: {
			'click .destroy': 'destroy',
			'click .edit': 'edit'
		},
		
		// delete: participant
		destroy:function() {
			
		},
		
		// edit: participant
		edit:function() {
			
		}
	});
});
