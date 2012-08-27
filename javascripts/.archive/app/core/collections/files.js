/*! app/collections/files
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Files
*/
define("app/collections/files",function(require,app) {
	var FileModel = require("app/models/file");

	app.collections.Files = app.Collection.extend({
		url: '/files/',
		model: FileModel
	});

	exports.app = app;
});
