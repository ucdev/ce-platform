/*! ce.Views.Edit.RowView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Edit",function(self,ce,Backbone,Marionette,$,_) {
	self.RowView = Backbone.Marionette.ItemView.extend({
		tagName: 'tr',
	
		template: 'edit/row',
		
		events: {
			'click .destroy': 'destroy',
			'click .edit': 'edit'
		},
		
		// delete: edit
		destroy:function() {
			
		},
		
		// edit: edit
		edit:function() {
			
		}
	});
});
