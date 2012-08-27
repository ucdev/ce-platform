/*! app/collections/person_addresses_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Person_addresses_paged
*/
define("app/collections/Person_addresses_paged",function(require,app) {
	var Person_addressModel = require("app/models/person_address");

	app.collections.Person_addresses_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/person_addresses/'
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
		    model: Person_addressModel
		});

	exports.app = app;
});
