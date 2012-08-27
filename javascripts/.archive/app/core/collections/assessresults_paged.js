/*! app/collections/assessresults_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Assessresults_paged
*/
define("app/collections/Assessresults_paged",function(require,app) {
	var AssessresultModel = require("app/models/assessresult");

	app.collections.Assessresults_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/assessresults/'
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
		    model: AssessresultModel
		});

	exports.app = app;
});
