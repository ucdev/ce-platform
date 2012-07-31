/*! ce.Views.Activity_credits.IndexView extends Backbone.Marionette.CompositeView */
ce.pkg("Views.Activity_credits",function(self,ce,Backbone,Marionette,$,_) {
	self.IndexView = Backbone.Marionette.CompositeView.extend({
		tagName: 'table',
		itemView: self.RowView,
		template: 'activity_credits/index',
		
		events: {
			'click .new': 'newRecord'
		},
		
		appendHtml: function(collectionView, itemView) {
			collectionView.$('.activity_credits').append(itemView.el);
		},
		
		newRecord:function() {
				
		}
	});
});
