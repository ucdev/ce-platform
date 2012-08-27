/*! app/collections/activity_accmes_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Activity_accmes_paged
*/
define("app/collections/Activity_accmes_paged",function(require,app) {
	var Activity_accmeModel = require("app/models/activity_accme");

	app.collections.Activity_accmes_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/activity_accmes/'
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
		    model: Activity_accmeModel
		});

	exports.app = app;
});
