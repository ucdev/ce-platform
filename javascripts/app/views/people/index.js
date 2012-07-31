/*! ce.Views.People.IndexView extends Backbone.Marionette.CompositeView */
ce.pkg("Views.People",function(self,ce,Backbone,Marionette,$,_) {
	self.IndexView = Backbone.Marionette.CompositeView.extend({
		tagName: 'table',
		itemView: self.RowView,
		template: 'people/index',
		
		events: {
			'click .new': 'newRecord'
		},
		
		appendHtml: function(collectionView, itemView) {
			collectionView.$('.people').append(itemView.el);
		},
		
		newRecord:function() {
				
		}
	});
});
