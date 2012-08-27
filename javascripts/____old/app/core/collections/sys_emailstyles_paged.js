/*! app/collections/sys_emailstyles_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Sys_emailstyles_paged
*/
define("app/collections/Sys_emailstyles_paged",function(require,app) {
	var Sys_emailstyleModel = require("app/models/sys_emailstyle");

	app.collections.Sys_emailstyles_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/sys_emailstyles/'
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
		    model: Sys_emailstyleModel
		});

	exports.app = app;
});
