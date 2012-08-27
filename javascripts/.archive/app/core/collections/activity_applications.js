/*! app/collections/activity_applications
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_applications
*/
define("app/collections/activity_applications",function(require,app) {
	var Activity_applicationModel = require("app/models/activity_application");

	app.collections.Activity_applications = app.Collection.extend({
		url: '/activity_applications/',
		model: Activity_applicationModel
	});

	exports.app = app;
});
