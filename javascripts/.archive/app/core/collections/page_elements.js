/*! app/collections/page_elements
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Page_elements
*/
define("app/collections/page_elements",function(require,app) {
	var Page_elementModel = require("app/models/page_element");

	app.collections.Page_elements = app.Collection.extend({
		url: '/page_elements/',
		model: Page_elementModel
	});

	exports.app = app;
});
