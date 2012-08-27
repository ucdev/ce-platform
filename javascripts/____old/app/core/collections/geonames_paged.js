/*! app/collections/geonames_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Geonames_paged
*/
define("app/collections/Geonames_paged",function(require,app) {
	var GeonameModel = require("app/models/geoname");

	app.collections.Geonames_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/geonames/'
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
		    model: GeonameModel
		});

	exports.app = app;
});
