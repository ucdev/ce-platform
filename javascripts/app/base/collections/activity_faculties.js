/*! app/collections/activity_faculties
* 	@requires: app,app/models/activity_faculty
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_faculties
*/
define("app/collections/activity_faculties",["require","app","app/models"],function(require,app) {
	var Activity_facultyModel = require("app/models/activity_faculty");

	var Activity_faculties = app.Collection.extend({
		url: '/activity_faculties/',
		model: Activity_facultyModel
	});

	module.setExports(Activity_faculties);
});
