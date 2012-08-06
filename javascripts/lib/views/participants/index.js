/*! ce.Views.Participants.IndexView extends Backbone.Marionette.CompositeView */
ce.module("Views.Participants",function(self,ce,Backbone,Marionette,$,_) {
	self.IndexView = Backbone.Marionette.CompositeView.extend({
		tagName: 'table',
		itemView: self.RowView,
		template: 'participants/index',
		
		events: {
			'click .new': 'newRecord'
		},
		
		appendHtml: function(collectionView, itemView) {
			collectionView.$('.participants').append(itemView.el);
		},
		
		newRecord:function() {
				
		}
	});
});
