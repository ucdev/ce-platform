/*! app/collections/sys_sitelms_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Sys_sitelms_paged
*/
define("app/collections/Sys_sitelms_paged",function(require,app) {
	var Sys_sitelmModel = require("app/models/sys_sitelm");

	app.collections.Sys_sitelms_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/sys_sitelms/'
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
		    model: Sys_sitelmModel
		});

	exports.app = app;
});
