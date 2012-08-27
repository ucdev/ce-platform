/*! app/collections/activity_containers_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Activity_containers_paged
*/
define("app/collections/Activity_containers_paged",function(require,app) {
	var Activity_containerModel = require("app/models/activity_container");

	app.collections.Activity_containers_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/activity_containers/'
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
		    model: Activity_containerModel
		});

	exports.app = app;
});
