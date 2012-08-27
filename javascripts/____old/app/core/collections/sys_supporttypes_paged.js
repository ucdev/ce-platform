/*! app/collections/sys_supporttypes_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Sys_supporttypes_paged
*/
define("app/collections/Sys_supporttypes_paged",function(require,app) {
	var Sys_supporttypeModel = require("app/models/sys_supporttype");

	app.collections.Sys_supporttypes_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/sys_supporttypes/'
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
		    model: Sys_supporttypeModel
		});

	exports.app = app;
});
