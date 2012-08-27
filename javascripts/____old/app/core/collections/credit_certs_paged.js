/*! app/collections/credit_certs_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Credit_certs_paged
*/
define("app/collections/Credit_certs_paged",function(require,app) {
	var Credit_certModel = require("app/models/credit_cert");

	app.collections.Credit_certs_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/credit_certs/'
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
		    model: Credit_certModel
		});

	exports.app = app;
});
