/*! ce.Views.Activity_cdc.IndexView extends Backbone.Marionette.CompositeView */
ce.pkg("Views.Activity_cdc",function(self,ce,Backbone,Marionette,$,_) {
	self.IndexView = Backbone.Marionette.CompositeView.extend({
		tagName: 'table',
		itemView: self.RowView,
		template: 'activity_cdc/index',
		
		events: {
			'click .new': 'newRecord'
		},
		
		appendHtml: function(collectionView, itemView) {
			collectionView.$('.activity_cdc').append(itemView.el);
		},
		
		newRecord:function() {
				
		}
	});
});
