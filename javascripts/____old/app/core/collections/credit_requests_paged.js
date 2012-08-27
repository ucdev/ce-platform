/*! app/collections/credit_requests_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Credit_requests_paged
*/
define("app/collections/Credit_requests_paged",function(require,app) {
	var Credit_requestModel = require("app/models/credit_request");

	app.collections.Credit_requests_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/credit_requests/'
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
		    model: Credit_requestModel
		});

	exports.app = app;
});
