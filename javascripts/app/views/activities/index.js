/*! ce.Views.Activities.IndexView extends Backbone.Marionette.CompositeView */
ce.pkg("Views.Activities",function(self,ce,Backbone,Marionette,$,_) {
	self.IndexView = Backbone.Marionette.CompositeView.extend({
		tagName: 'table',
		itemView: self.RowView,
		template: 'activities/index',
		
		events: {
			'click .new': 'newRecord'
		},
		
		appendHtml: function(collectionView, itemView) {
			collectionView.$('.activities').append(itemView.el);
		},
		
		newRecord:function() {
				
		}
	});
});
