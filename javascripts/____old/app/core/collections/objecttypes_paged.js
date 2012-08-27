/*! app/collections/objecttypes_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Objecttypes_paged
*/
define("app/collections/Objecttypes_paged",function(require,app) {
	var ObjecttypeModel = require("app/models/objecttype");

	app.collections.Objecttypes_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/objecttypes/'
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
		    model: ObjecttypeModel
		});

	exports.app = app;
});
