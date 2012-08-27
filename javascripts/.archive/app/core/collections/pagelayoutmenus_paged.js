/*! app/collections/pagelayoutmenus_paged
* 	@requires: app,app/collection_paged,app/model
* 	@extends: app.Collection_paged
* 	@exports: app.collections.Pagelayoutmenus_paged
*/
define("app/collections/Pagelayoutmenus_paged",function(require,app) {
	var PagelayoutmenuModel = require("app/models/pagelayoutmenu");

	app.collections.Pagelayoutmenus_paged = app.Collection_paged.extend({
			initialize: function() {},
		    paginator_core: {
		      type: 'get',
		      dataType: 'json',
		      url: '/api/pagelayoutmenus/'
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
		    model: PagelayoutmenuModel
		});

	exports.app = app;
});
