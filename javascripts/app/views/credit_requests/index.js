/*! ce.Views.Credit_requests.IndexView extends Backbone.Marionette.CompositeView */
ce.pkg("Views.Credit_requests",function(self,ce,Backbone,Marionette,$,_) {
	self.IndexView = Backbone.Marionette.CompositeView.extend({
		tagName: 'table',
		itemView: self.RowView,
		template: 'credit_requests/index',
		
		events: {
			'click .new': 'newRecord'
		},
		
		appendHtml: function(collectionView, itemView) {
			collectionView.$('.credit_requests').append(itemView.el);
		},
		
		newRecord:function() {
				
		}
	});
});
