/*! app/collections/activity_tag_relates_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Activity_tag_relates_paged
*/
define("app/collections/Activity_tag_relates_paged",function(require,app) {
	var Activity_tag_relateModel = require("app/models/activity_tag_relate");

	app.collections.Activity_tag_relates_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/activity_tag_relates/'
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
		    model: Activity_tag_relateModel
		});

	exports.app = app;
});
