/*! app/collections/page_sections_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Page_sections_paged
*/
define("app/collections/Page_sections_paged",function(require,app) {
	var Page_sectionModel = require("app/models/page_section");

	app.collections.Page_sections_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/page_sections/'
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
		    model: Page_sectionModel
		});

	exports.app = app;
});
