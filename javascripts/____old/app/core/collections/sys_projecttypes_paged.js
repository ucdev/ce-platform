/*! app/collections/sys_projecttypes_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Sys_projecttypes_paged
*/
define("app/collections/Sys_projecttypes_paged",function(require,app) {
	var Sys_projecttypeModel = require("app/models/sys_projecttype");

	app.collections.Sys_projecttypes_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/sys_projecttypes/'
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
		    model: Sys_projecttypeModel
		});

	exports.app = app;
});
