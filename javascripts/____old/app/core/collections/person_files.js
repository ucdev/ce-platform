/*! app/collections/person_files
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Person_files
*/
define("app/collections/person_files",function(require,app) {
	var Person_fileModel = require("app/models/person_file");

	app.collections.Person_files = app.Collection.extend({
		url: '/person_files/',
		model: Person_fileModel
	});

	exports.app = app;
});
