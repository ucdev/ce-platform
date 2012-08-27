/*! app/collections/pagelayoutmenu_pages
* 	@requires: app,app/collection,app/models/pagelayoutmenu_page
* 	@extends: app.Collection
* 	@exports: app.collections.Pagelayoutmenu_pages
*/
define("app/collections/pagelayoutmenu_pages",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Pagelayoutmenu_pageModel = require("app/models/pagelayoutmenu_page");
	
	Pagelayoutmenu_pages = AppCollection.extend({
		url: '/pagelayoutmenu_pages/',
		model: Pagelayoutmenu_pageModel
	});

	module.setExports(Pagelayoutmenu_pages);
});
