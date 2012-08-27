/*! app/collections/images
* 	@requires: app,app/models/image
* 	@extends: app.Collection
* 	@exports: app.collections.Images
*/
define("app/collections/images",["require","app","app/models"],function(require,app) {
	var ImageModel = require("app/models/image");

	var Images = app.Collection.extend({
		url: '/images/',
		model: ImageModel
	});

	module.setExports(Images);
});
