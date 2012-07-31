/*! ce.Views.Activity_credits.RowView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Activity_credits",function(self,ce,Backbone,Marionette,$,_) {
	self.RowView = Backbone.Marionette.ItemView.extend({
		tagName: 'tr',
	
		template: 'activity_credits/row',
		
		events: {
			'click .destroy': 'destroy',
			'click .edit': 'edit'
		},
		
		// delete: activity_credit
		destroy:function() {
			
		},
		
		// edit: activity_credit
		edit:function() {
			
		}
	});
});
