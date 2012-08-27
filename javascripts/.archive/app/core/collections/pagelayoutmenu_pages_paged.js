/*! app/collections/pagelayoutmenu_pages_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Pagelayoutmenu_pages_paged
*/
define("app/collections/Pagelayoutmenu_pages_paged",function(require,app) {
	var Pagelayoutmenu_pageModel = require("app/models/pagelayoutmenu_page");

	app.collections.Pagelayoutmenu_pages_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/pagelayoutmenu_pages/'
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
		    model: Pagelayoutmenu_pageModel
		});

	exports.app = app;
});
