/*! app/collections/categories
* 	@requires: app,app/models/category
* 	@extends: app.Collection
* 	@exports: app.collections.Categories
*/
define("app/collections/categories",["require","app","app/models"],function(require,app) {
	var CategoryModel = require("app/models/category");

	var Categories = app.Collection.extend({
		url: '/categories/',
		model: CategoryModel
	});

	module.setExports(Categories);
});
