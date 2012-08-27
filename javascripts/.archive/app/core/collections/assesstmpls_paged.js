/*! app/collections/assesstmpls_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Assesstmpls_paged
*/
define("app/collections/Assesstmpls_paged",function(require,app) {
	var AssesstmplModel = require("app/models/assesstmpl");

	app.collections.Assesstmpls_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/assesstmpls/'
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
		    model: AssesstmplModel
		});

	exports.app = app;
});
