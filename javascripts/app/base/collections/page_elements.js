/*! app/collections/page_elements
* 	@requires: app,app/models/page_element
* 	@extends: app.Collection
* 	@exports: app.collections.Page_elements
*/
define("app/collections/page_elements",["require","app","app/models"],function(require,app) {
	var Page_elementModel = require("app/models/page_element");

	var Page_elements = app.Collection.extend({
		url: '/page_elements/',
		model: Page_elementModel
	});

	module.setExports(Page_elements);
});
