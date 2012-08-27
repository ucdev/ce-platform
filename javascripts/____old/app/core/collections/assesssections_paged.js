/*! app/collections/assesssections_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Assesssections_paged
*/
define("app/collections/Assesssections_paged",function(require,app) {
	var AssesssectionModel = require("app/models/assesssection");

	app.collections.Assesssections_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/assesssections/'
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
		    model: AssesssectionModel
		});

	exports.app = app;
});
