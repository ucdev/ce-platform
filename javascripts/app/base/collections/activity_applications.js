/*! app/collections/activity_applications
* 	@requires: app,app/models/activity_application
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_applications
*/
define("app/collections/activity_applications",["require","app","app/models"],function(require,app) {
	var Activity_applicationModel = require("app/models/activity_application");

	var Activity_applications = app.Collection.extend({
		url: '/activity_applications/',
		model: Activity_applicationModel
	});

	module.setExports(Activity_applications);
});
