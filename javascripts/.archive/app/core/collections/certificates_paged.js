/*! app/collections/certificates_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Certificates_paged
*/
define("app/collections/Certificates_paged",function(require,app) {
	var CertificateModel = require("app/models/certificate");

	app.collections.Certificates_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/certificates/'
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
		    model: CertificateModel
		});

	exports.app = app;
});
