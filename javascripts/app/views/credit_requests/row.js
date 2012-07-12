/*! ce.Views.Credit_requests.RowView extends Backbone.Marionette.ItemView */
ce.module("Views.Credit_requests",function(self,ce,Backbone,Marionette,$,_) {
	self.RowView = Backbone.Marionette.ItemView.extend({
		tagName: 'tr',
	
		template: 'credit_requests/row',
		
		events: {
			'click .destroy': 'destroy',
			'click .edit': 'edit'
		},
		
		// delete: credit_request
		destroy:function() {
			
		},
		
		// edit: credit_request
		edit:function() {
			
		}
	});
});
