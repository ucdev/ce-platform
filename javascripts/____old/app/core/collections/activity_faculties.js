/*! app/collections/activity_faculties
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_faculties
*/
define("app/collections/activity_faculties",function(require,app) {
	var Activity_facultyModel = require("app/models/activity_faculty");

	app.collections.Activity_faculties = app.Collection.extend({
		url: '/activity_faculties/',
		model: Activity_facultyModel
	});

	exports.app = app;
});
