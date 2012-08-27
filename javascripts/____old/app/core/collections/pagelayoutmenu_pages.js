/*! app/collections/pagelayoutmenu_pages
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Pagelayoutmenu_pages
*/
define("app/collections/pagelayoutmenu_pages",function(require,app) {
	var Pagelayoutmenu_pageModel = require("app/models/pagelayoutmenu_page");

	app.collections.Pagelayoutmenu_pages = app.Collection.extend({
		url: '/pagelayoutmenu_pages/',
		model: Pagelayoutmenu_pageModel
	});

	exports.app = app;
});
