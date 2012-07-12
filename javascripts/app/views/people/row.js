/*! ce.Views.People.RowView extends Backbone.Marionette.ItemView */
ce.module("Views.People",function(self,ce,Backbone,Marionette,$,_) {
	self.RowView = Backbone.Marionette.ItemView.extend({
		tagName: 'tr',
	
		template: 'people/row',
		
		events: {
			'click .destroy': 'destroy',
			'click .edit': 'edit'
		},
		
		// delete: person
		destroy:function() {
			
		},
		
		// edit: person
		edit:function() {
			
		}
	});
});
