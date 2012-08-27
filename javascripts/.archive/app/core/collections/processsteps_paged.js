/*! app/collections/processsteps_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Processsteps_paged
*/
define("app/collections/Processsteps_paged",function(require,app) {
	var ProcessstepModel = require("app/models/processstep");

	app.collections.Processsteps_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/processsteps/'
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
		    model: ProcessstepModel
		});

	exports.app = app;
});
