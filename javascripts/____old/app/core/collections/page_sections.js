/*! app/collections/page_sections
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Page_sections
*/
define("app/collections/page_sections",function(require,app) {
	var Page_sectionModel = require("app/models/page_section");

	app.collections.Page_sections = app.Collection.extend({
		url: '/page_sections/',
		model: Page_sectionModel
	});

	exports.app = app;
});
