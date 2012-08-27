/*! app/collections/degree_credits_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Degree_credits_paged
*/
define("app/collections/Degree_credits_paged",function(require,app) {
	var Degree_creditModel = require("app/models/degree_credit");

	app.collections.Degree_credits_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/degree_credits/'
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
		    model: Degree_creditModel
		});

	exports.app = app;
});
