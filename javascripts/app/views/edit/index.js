/*! ce.Views.Edit.IndexView extends Backbone.Marionette.CompositeView */
ce.pkg("Views.Edit",function(self,ce,Backbone,Marionette,$,_) {
	self.IndexView = Backbone.Marionette.CompositeView.extend({
		tagName: 'table',
		itemView: self.RowView,
		template: 'edit/index',
		
		events: {
			'click .new': 'newRecord'
		},
		
		appendHtml: function(collectionView, itemView) {
			collectionView.$('.edit').append(itemView.el);
		},
		
		newRecord:function() {
				
		}
	});
});
