/*! ce.Collections.Activity_participants extends Backbone.Collection */
ce.module("Collections",function(self,ce,Backbone,Marionette,$,_) {
	self.Activity_participants = Backbone.Paginator.clientPager.extend({
		initialize: function() {
		},
		paginator_core: {
			type: 'post',
			dataType: 'json',
			url: '/activity_participants/loadData/'
		},
		paginator_ui: {
			firstPage: 1,
			currentPage: 1,
			perPage: 15
		},
		parse: function(response) {
			return response;
		}
	});
});
