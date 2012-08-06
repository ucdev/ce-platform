/*! ce.Views.Messages.IndexView extends Backbone.Marionette.CompositeView */
ce.module("Views.Messages",function(self,ce,Backbone,Marionette,$,_) {
	self.IndexView = Backbone.Marionette.CompositeView.extend({
		tagName: 'table',
		itemView: self.RowView,
		template: 'messages/index',
		
		events: {
			'click .new': 'newRecord'
		},
		
		appendHtml: function(collectionView, itemView) {
			collectionView.$('.messages').append(itemView.el);
		},
		
		newRecord:function() {
				
		}
	});
});
