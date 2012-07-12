/*! ce.Views.Activities.RowView extends Backbone.Marionette.ItemView */
ce.module("Views.Activities",function(self,ce,Backbone,Marionette,$,_) {
	self.RowView = Backbone.Marionette.ItemView.extend({
		tagName: 'tr',
	
		template: 'activities/row',
		
		events: {
			'click .destroy': 'destroy',
			'click .edit': 'edit'
		},
		
		// delete: activity
		destroy:function() {
			
		},
		
		// edit: activity
		edit:function() {
			
		}
	});
});
