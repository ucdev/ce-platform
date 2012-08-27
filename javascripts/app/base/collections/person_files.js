/*! app/collections/person_files
* 	@requires: app,app/collection,app/models/person_file
* 	@extends: app.Collection
* 	@exports: app.collections.Person_files
*/
define("app/collections/person_files",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Person_fileModel = require("app/models/person_file");
	
	Person_files = AppCollection.extend({
		url: '/person_files/',
		model: Person_fileModel
	});

	module.setExports(Person_files);
});
