/*! app/collections/pagelayouts
* 	@requires: app,app/collection,app/models/pagelayout
* 	@extends: app.Collection
* 	@exports: app.collections.Pagelayouts
*/
define("app/collections/pagelayouts",["require"],function(require) {
	var AppCollection = require("app/collection");
	var PagelayoutModel = require("app/models/pagelayout");
	
	Pagelayouts = AppCollection.extend({
		url: '/pagelayouts/',
		model: PagelayoutModel
	});

	module.setExports(Pagelayouts);
});
