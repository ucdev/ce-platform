/*! ce.Collections.Activity_participants extends Backbone.Collection */
ce.module("Collections",function(self,ce,Backbone,Marionette,$,_) {
	self.Activity_participants = Backbone.View.extend({
		initialize: function(params) {
			var that = this;
			this._participantViews = [];	// CONTAINS ARRAY OF PARTICIPANTS
			
			$.each(params.collection, function(i, item) {
				that._participantViews.push(new updateRowView({
					model : item,
					tagName : 'tr'
				}));
			});
		},
		
		render: function() {
			var that = this;
			// Clear out this element.
			$(this.el).empty();
			
			// Render each sub-view and append it to the parent view's element.
			_(this._participantViews).each(function(participant) {
				participant.model.row.appendTo(that.$el);
			});
		},
		
		url: '/api/activity_participants'
	});
});
