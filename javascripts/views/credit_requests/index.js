CE.Views.credit_requests.index = Backbone.Marionette.CompositeView.extend({
	tagName: 'table',
	// CONNECT THE ROW
	itemView: CE.Views.credit_requests.row,
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

