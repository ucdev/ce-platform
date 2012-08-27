/*! app/collections/pages
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Pages
*/
define("app/collections/pages",function(require,app) {
	var PageModel = require("app/models/page");

	app.collections.Pages = app.Collection.extend({
		url: '/pages/',
		model: PageModel
	});

	exports.app = app;
});
