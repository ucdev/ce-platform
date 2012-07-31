/*! ce.Views.Activity_participants.IndexView extends Backbone.Marionette.CompositeView */
ce.pkg("Views.Activity_participants",function(self,ce,Backbone,Marionette,$,_) {
	self.IndexView = Backbone.Marionette.CompositeView.extend({
		tagName: 'table',
		itemView: self.RowView,
		template: 'activity_participants/index',
		
		events: {
			'click .new': 'newRecord'
		},
		
		appendHtml: function(collectionView, itemView) {
			collectionView.$('.activity_participants').append(itemView.el);
		},
		
		newRecord:function() {
				
		}
	});
});
