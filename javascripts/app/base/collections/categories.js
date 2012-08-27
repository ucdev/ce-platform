/*! app/collections/categories
* 	@requires: app,app/collection,app/models/category
* 	@extends: app.Collection
* 	@exports: app.collections.Categories
*/
define("app/collections/categories",["require"],function(require) {
	var AppCollection = require("app/collection");
	var CategoryModel = require("app/models/category");
	
	Categories = AppCollection.extend({
		url: '/categories/',
		model: CategoryModel
	});

	module.setExports(Categories);
});
