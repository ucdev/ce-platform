/*! app/collections/pagelayoutmenus
* 	@requires: app,app/collection,app/models/pagelayoutmenu
* 	@extends: app.Collection
* 	@exports: app.collections.Pagelayoutmenus
*/
define("app/collections/pagelayoutmenus",["require"],function(require) {
	var AppCollection = require("app/collection");
	var PagelayoutmenuModel = require("app/models/pagelayoutmenu");
	
	Pagelayoutmenus = AppCollection.extend({
		url: '/pagelayoutmenus/',
		model: PagelayoutmenuModel
	});

	module.setExports(Pagelayoutmenus);
});
