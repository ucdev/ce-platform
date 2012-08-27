/*! app/collections/pagelayoutmenu_pages
* 	@requires: app,app/models/pagelayoutmenu_page
* 	@extends: app.Collection
* 	@exports: app.collections.Pagelayoutmenu_pages
*/
define("app/collections/pagelayoutmenu_pages",["require","app","app/models"],function(require,app) {
	var Pagelayoutmenu_pageModel = require("app/models/pagelayoutmenu_page");

	var Pagelayoutmenu_pages = app.Collection.extend({
		url: '/pagelayoutmenu_pages/',
		model: Pagelayoutmenu_pageModel
	});

	module.setExports(Pagelayoutmenu_pages);
});
