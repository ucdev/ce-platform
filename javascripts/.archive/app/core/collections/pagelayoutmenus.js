/*! app/collections/pagelayoutmenus
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Pagelayoutmenus
*/
define("app/collections/pagelayoutmenus",function(require,app) {
	var PagelayoutmenuModel = require("app/models/pagelayoutmenu");

	app.collections.Pagelayoutmenus = app.Collection.extend({
		url: '/pagelayoutmenus/',
		model: PagelayoutmenuModel
	});

	exports.app = app;
});
