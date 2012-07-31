/*! ce.Views.Sessions.RowView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Sessions",function(self,ce,Backbone,Marionette,$,_) {
	self.RowView = Backbone.Marionette.ItemView.extend({
		tagName: 'tr',
	
		template: 'sessions/row',
		
		events: {
			'click .destroy': 'destroy',
			'click .edit': 'edit'
		},
		
		// delete: session
		destroy:function() {
			
		},
		
		// edit: session
		edit:function() {
			
		}
	});
});
