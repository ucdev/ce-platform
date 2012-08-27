/*! app/collections/imagetypes
* 	@requires: app,app/collection,app/models/imagetype
* 	@extends: app.Collection
* 	@exports: app.collections.Imagetypes
*/
define("app/collections/imagetypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var ImagetypeModel = require("app/models/imagetype");
	
	Imagetypes = AppCollection.extend({
		url: '/imagetypes/',
		model: ImagetypeModel
	});

	module.setExports(Imagetypes);
});
