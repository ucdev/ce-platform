/*! app/collections/imagetypes
* 	@requires: app,app/models/imagetype
* 	@extends: app.Collection
* 	@exports: app.collections.Imagetypes
*/
define("app/collections/imagetypes",["require","app","app/models"],function(require,app) {
	var ImagetypeModel = require("app/models/imagetype");

	var Imagetypes = app.Collection.extend({
		url: '/imagetypes/',
		model: ImagetypeModel
	});

	module.setExports(Imagetypes);
});
