/*! app/collections/images
* 	@requires: app,app/collection,app/models/image
* 	@extends: app.Collection
* 	@exports: app.collections.Images
*/
define("app/collections/images",["require"],function(require) {
	var AppCollection = require("app/collection");
	var ImageModel = require("app/models/image");
	
	Images = AppCollection.extend({
		url: '/images/',
		model: ImageModel
	});

	module.setExports(Images);
});
