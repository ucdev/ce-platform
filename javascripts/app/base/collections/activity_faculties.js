/*! app/collections/activity_faculties
* 	@requires: app,app/collection,app/models/activity_faculty
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_faculties
*/
define("app/collections/activity_faculties",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_facultyModel = require("app/models/activity_faculty");
	
	Activity_faculties = AppCollection.extend({
		url: '/activity_faculties/',
		model: Activity_facultyModel
	});

	module.setExports(Activity_faculties);
});
