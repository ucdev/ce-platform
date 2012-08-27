/*! app/collections/files
* 	@requires: app,app/collection,app/models/file
* 	@extends: app.Collection
* 	@exports: app.collections.Files
*/
define("app/collections/files",["require"],function(require) {
	var AppCollection = require("app/collection");
	var FileModel = require("app/models/file");
	
	Files = AppCollection.extend({
		url: '/files/',
		model: FileModel
	});

	module.setExports(Files);
});
