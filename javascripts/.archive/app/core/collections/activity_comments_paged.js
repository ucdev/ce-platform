/*! app/collections/activity_comments_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Activity_comments_paged
*/
define("app/collections/Activity_comments_paged",function(require,app) {
	var Activity_commentModel = require("app/models/activity_comment");

	app.collections.Activity_comments_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/activity_comments/'
		    },
		    paginator_ui: {
		      firstPage: 1,
		      currentPage: 1,
		      perPage: 15
		    },
		    parse: function(response) {
		      this.totalPages = Math.ceil(response.length / this.perPage);
		      return response;
		    },
		    model: Activity_commentModel
		});

	exports.app = app;
});
