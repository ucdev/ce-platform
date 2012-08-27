/*! app/collections/activity_applications
* 	@requires: app,app/collection,app/models/activity_application
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_applications
*/
define("app/collections/activity_applications",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_applicationModel = require("app/models/activity_application");
	
	Activity_applications = AppCollection.extend({
		url: '/activity_applications/',
		model: Activity_applicationModel
	});

	module.setExports(Activity_applications);
});
