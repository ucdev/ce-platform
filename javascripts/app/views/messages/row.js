/*! ce.Views.Messages.RowView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Messages",function(self,ce,Backbone,Marionette,$,_) {
	self.RowView = Backbone.Marionette.ItemView.extend({
		tagName: 'tr',
	
		template: 'messages/row',
		
		events: {
			'click .destroy': 'destroy',
			'click .edit': 'edit'
		},
		
		// delete: message
		destroy:function() {
			
		},
		
		// edit: message
		edit:function() {
			
		}
	});
});
