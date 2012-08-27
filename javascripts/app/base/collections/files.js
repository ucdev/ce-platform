/*! app/collections/files
* 	@requires: app,app/models/file
* 	@extends: app.Collection
* 	@exports: app.collections.Files
*/
define("app/collections/files",["require","app","app/models"],function(require,app) {
	var FileModel = require("app/models/file");

	var Files = app.Collection.extend({
		url: '/files/',
		model: FileModel
	});

	module.setExports(Files);
});
