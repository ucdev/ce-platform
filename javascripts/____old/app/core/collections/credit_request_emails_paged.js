/*! app/collections/credit_request_emails_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Credit_request_emails_paged
*/
define("app/collections/Credit_request_emails_paged",function(require,app) {
	var Credit_request_emailModel = require("app/models/credit_request_email");

	app.collections.Credit_request_emails_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/credit_request_emails/'
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
		    model: Credit_request_emailModel
		});

	exports.app = app;
});
