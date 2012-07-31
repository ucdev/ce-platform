/*! ce.Views.Main.IndexView extends Backbone.Marionette.CompositeView */
ce.pkg("Views.Main",function(self,ce,Backbone,Marionette,$,_) {
	self.IndexView = Backbone.Marionette.CompositeView.extend({
		tagName: 'table',
		itemView: self.RowView,
		template: 'main/index',
		
		events: {
			'click .new': 'newRecord'
		},
		
		appendHtml: function(collectionView, itemView) {
			collectionView.$('.main').append(itemView.el);
		},
		
		newRecord:function() {
				
		}
	});
});
