/*! app/collections/pagelayouts_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Pagelayouts_paged
*/
define("app/collections/Pagelayouts_paged",function(require,app) {
	var PagelayoutModel = require("app/models/pagelayout");

	app.collections.Pagelayouts_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/pagelayouts/'
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
		    model: PagelayoutModel
		});

	exports.app = app;
});
