/*! app/collections/page_elements
* 	@requires: app,app/collection,app/models/page_element
* 	@extends: app.Collection
* 	@exports: app.collections.Page_elements
*/
define("app/collections/page_elements",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Page_elementModel = require("app/models/page_element");
	
	Page_elements = AppCollection.extend({
		url: '/page_elements/',
		model: Page_elementModel
	});

	module.setExports(Page_elements);
});
