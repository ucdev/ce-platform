/*! app/collections/pagelayoutmenus
* 	@requires: app,app/models/pagelayoutmenu
* 	@extends: app.Collection
* 	@exports: app.collections.Pagelayoutmenus
*/
define("app/collections/pagelayoutmenus",["require","app","app/models"],function(require,app) {
	var PagelayoutmenuModel = require("app/models/pagelayoutmenu");

	var Pagelayoutmenus = app.Collection.extend({
		url: '/pagelayoutmenus/',
		model: PagelayoutmenuModel
	});

	module.setExports(Pagelayoutmenus);
});
