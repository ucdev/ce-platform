/*! app/collections/sys_degrees_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Sys_degrees_paged
*/
define("app/collections/Sys_degrees_paged",function(require,app) {
	var Sys_degreeModel = require("app/models/sys_degree");

	app.collections.Sys_degrees_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/sys_degrees/'
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
		    model: Sys_degreeModel
		});

	exports.app = app;
});
