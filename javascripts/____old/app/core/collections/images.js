/*! app/collections/images
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Images
*/
define("app/collections/images",function(require,app) {
	var ImageModel = require("app/models/image");

	app.collections.Images = app.Collection.extend({
		url: '/images/',
		model: ImageModel
	});

	exports.app = app;
});
