/*! ce.Views.Sessions.IndexView extends Backbone.Marionette.CompositeView */
ce.pkg("Views.Sessions",function(self,ce,Backbone,Marionette,$,_) {
	self.IndexView = Backbone.Marionette.CompositeView.extend({
		tagName: 'table',
		itemView: self.RowView,
		template: 'sessions/index',
		
		events: {
			'click .new': 'newRecord'
		},
		
		appendHtml: function(collectionView, itemView) {
			collectionView.$('.sessions').append(itemView.el);
		},
		
		newRecord:function() {
				
		}
	});
});
