/*! app/collections/page_sections
* 	@requires: app,app/models/page_section
* 	@extends: app.Collection
* 	@exports: app.collections.Page_sections
*/
define("app/collections/page_sections",["require","app","app/models"],function(require,app) {
	var Page_sectionModel = require("app/models/page_section");

	var Page_sections = app.Collection.extend({
		url: '/page_sections/',
		model: Page_sectionModel
	});

	module.setExports(Page_sections);
});
