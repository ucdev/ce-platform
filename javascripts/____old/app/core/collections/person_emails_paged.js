/*! app/collections/person_emails_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Person_emails_paged
*/
define("app/collections/Person_emails_paged",function(require,app) {
	var Person_emailModel = require("app/models/person_email");

	app.collections.Person_emails_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/person_emails/'
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
		    model: Person_emailModel
		});

	exports.app = app;
});
