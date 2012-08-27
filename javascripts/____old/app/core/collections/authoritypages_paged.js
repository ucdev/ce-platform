/*! app/collections/authoritypages_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Authoritypages_paged
*/
define("app/collections/Authoritypages_paged",function(require,app) {
	var AuthoritypageModel = require("app/models/authoritypage");

	app.collections.Authoritypages_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/authoritypages/'
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
		    model: AuthoritypageModel
		});

	exports.app = app;
});
