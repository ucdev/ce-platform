/*! app/collections/pages
* 	@requires: app,app/models/page
* 	@extends: app.Collection
* 	@exports: app.collections.Pages
*/
define("app/collections/pages",["require","app","app/models"],function(require,app) {
	var PageModel = require("app/models/page");

	var Pages = app.Collection.extend({
		url: '/pages/',
		model: PageModel
	});

	module.setExports(Pages);
});
