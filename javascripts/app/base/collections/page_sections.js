/*! app/collections/page_sections
* 	@requires: app,app/collection,app/models/page_section
* 	@extends: app.Collection
* 	@exports: app.collections.Page_sections
*/
define("app/collections/page_sections",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Page_sectionModel = require("app/models/page_section");
	
	Page_sections = AppCollection.extend({
		url: '/page_sections/',
		model: Page_sectionModel
	});

	module.setExports(Page_sections);
});
