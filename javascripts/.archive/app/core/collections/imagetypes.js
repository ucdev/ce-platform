/*! app/collections/imagetypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Imagetypes
*/
define("app/collections/imagetypes",function(require,app) {
	var ImagetypeModel = require("app/models/imagetype");

	app.collections.Imagetypes = app.Collection.extend({
		url: '/imagetypes/',
		model: ImagetypeModel
	});

	exports.app = app;
});
