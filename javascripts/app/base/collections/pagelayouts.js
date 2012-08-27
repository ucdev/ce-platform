/*! app/collections/pagelayouts
* 	@requires: app,app/models/pagelayout
* 	@extends: app.Collection
* 	@exports: app.collections.Pagelayouts
*/
define("app/collections/pagelayouts",["require","app","app/models"],function(require,app) {
	var PagelayoutModel = require("app/models/pagelayout");

	var Pagelayouts = app.Collection.extend({
		url: '/pagelayouts/',
		model: PagelayoutModel
	});

	module.setExports(Pagelayouts);
});
