/*! app/collections/pagelayouts
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Pagelayouts
*/
define("app/collections/pagelayouts",function(require,app) {
	var PagelayoutModel = require("app/models/pagelayout");

	app.collections.Pagelayouts = app.Collection.extend({
		url: '/pagelayouts/',
		model: PagelayoutModel
	});

	exports.app = app;
});
