/*! ce.Views.Activity_cdc.RowView extends Backbone.Marionette.ItemView */
ce.module("Views.Activity_cdc",function(self,ce,Backbone,Marionette,$,_) {
	self.RowView = Backbone.Marionette.ItemView.extend({
		tagName: 'tr',
	
		template: 'activity_cdc/row',
		
		events: {
			'click .destroy': 'destroy',
			'click .edit': 'edit'
		},
		
		// delete: activity_cdc
		destroy:function() {
			
		},
		
		// edit: activity_cdc
		edit:function() {
			
		}
	});
});
