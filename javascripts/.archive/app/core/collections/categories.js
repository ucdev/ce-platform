/*! app/collections/categories
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Categories
*/
define("app/collections/categories",function(require,app) {
	var CategoryModel = require("app/models/category");

	app.collections.Categories = app.Collection.extend({
		url: '/categories/',
		model: CategoryModel
	});

	exports.app = app;
});
