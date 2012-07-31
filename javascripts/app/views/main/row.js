/*! ce.Views.Main.RowView extends Backbone.Marionette.ItemView */
ce.pkg("Views.Main",function(self,ce,Backbone,Marionette,$,_) {
	self.RowView = Backbone.Marionette.ItemView.extend({
		tagName: 'tr',
	
		template: 'main/row',
		
		events: {
			'click .destroy': 'destroy',
			'click .edit': 'edit'
		},
		
		// delete: main
		destroy:function() {
			
		},
		
		// edit: main
		edit:function() {
			
		}
	});
});
