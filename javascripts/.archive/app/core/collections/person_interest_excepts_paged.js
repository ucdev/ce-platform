/*! app/collections/person_interest_excepts_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Person_interest_excepts_paged
*/
define("app/collections/Person_interest_excepts_paged",function(require,app) {
	var Person_interest_exceptModel = require("app/models/person_interest_except");

	app.collections.Person_interest_excepts_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/person_interest_excepts/'
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
		    model: Person_interest_exceptModel
		});

	exports.app = app;
});
