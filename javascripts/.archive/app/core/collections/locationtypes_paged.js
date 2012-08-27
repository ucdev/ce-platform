/*! app/collections/locationtypes_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Locationtypes_paged
*/
define("app/collections/Locationtypes_paged",function(require,app) {
	var LocationtypeModel = require("app/models/locationtype");

	app.collections.Locationtypes_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/locationtypes/'
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
		    model: LocationtypeModel
		});

	exports.app = app;
});
