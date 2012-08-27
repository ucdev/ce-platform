/*! app/collections/person_files
* 	@requires: app,app/models/person_file
* 	@extends: app.Collection
* 	@exports: app.collections.Person_files
*/
define("app/collections/person_files",["require","app","app/models"],function(require,app) {
	var Person_fileModel = require("app/models/person_file");

	var Person_files = app.Collection.extend({
		url: '/person_files/',
		model: Person_fileModel
	});

	module.setExports(Person_files);
});
