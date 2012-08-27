/*! app/collections/professionareas_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Professionareas_paged
*/
define("app/collections/Professionareas_paged",function(require,app) {
	var ProfessionareaModel = require("app/models/professionarea");

	app.collections.Professionareas_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/professionareas/'
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
		    model: ProfessionareaModel
		});

	exports.app = app;
});
