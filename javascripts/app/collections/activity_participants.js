/*! ce.Collections.Activity_participants extends Backbone.Collection */
ce.module("Collections",function(self,ce,Backbone,Marionette,$,_) {
	self.Activity_participants = Backbone.Paginator.clientPager.extend({
		initialize: function() {
		},
		model: ce.Models.Activity_participant,
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
		server_api: {
			'$format': 'json',
			'orderby': 'fullName',
			'$skip': function() { return this.totalPages * this.perPage }
		},
		parse: function(response) {
			console.dir(response);
		}
	});
});
