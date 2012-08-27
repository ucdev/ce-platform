/*! app/collections/stat_logs_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Stat_logs_paged
*/
define("app/collections/Stat_logs_paged",function(require,app) {
	var Stat_logModel = require("app/models/stat_log");

	app.collections.Stat_logs_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/stat_logs/'
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
		    model: Stat_logModel
		});

	exports.app = app;
});
