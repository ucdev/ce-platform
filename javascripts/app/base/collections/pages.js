/*! app/collections/pages
* 	@requires: app,app/collection,app/models/page
* 	@extends: app.Collection
* 	@exports: app.collections.Pages
*/
define("app/collections/pages",["require"],function(require) {
	var AppCollection = require("app/collection");
	var PageModel = require("app/models/page");
	
	Pages = AppCollection.extend({
		url: '/pages/',
		model: PageModel
	});

	module.setExports(Pages);
});
