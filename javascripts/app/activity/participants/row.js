/*! ce.Views.Activity_participants.IndexView extends Backbone.Marionette.CompositeView */
ce.module("activity.participants",function(self,ce,Backbone,Marionette,$,_) {
	self.RowView = Backbone.Marionette.CompositeView.extend({
		tagName: 'table',
		itemView: self.RowView,
		template: 'activity_participants/index',
		
		events: {
			'click .new': 'newRecord',
			'onMouseOver .link': 'clickMe'
		},
		 
		newRecord:function() {
				
		}
	});
});