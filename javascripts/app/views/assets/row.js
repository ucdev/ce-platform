/*! ce.Views.Assets.RowView extends Backbone.Marionette.ItemView */
ce.module("Views.Assets",function(self,ce,Backbone,Marionette,$,_) {
	self.RowView = Backbone.Marionette.ItemView.extend({
		tagName: 'tr',
	
		template: 'assets/row',
		
		events: {
			'click .destroy': 'destroy',
			'click .edit': 'edit'
		},
		
		// delete: asset
		destroy:function() {
			
		},
		
		// edit: asset
		edit:function() {
			
		}
	});
});
