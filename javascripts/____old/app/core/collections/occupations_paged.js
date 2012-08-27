/*! app/collections/occupations_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Occupations_paged
*/
define("app/collections/Occupations_paged",function(require,app) {
	var OccupationModel = require("app/models/occupation");

	app.collections.Occupations_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/occupations/'
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
		    model: OccupationModel
		});

	exports.app = app;
});
