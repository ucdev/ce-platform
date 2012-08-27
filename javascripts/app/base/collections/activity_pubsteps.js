/*! app/collections/activity_pubsteps
* 	@requires: app,app/collection,app/models/activity_pubstep
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_pubsteps
*/
define("app/collections/activity_pubsteps",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_pubstepModel = require("app/models/activity_pubstep");
	
	Activity_pubsteps = AppCollection.extend({
		url: '/activity_pubsteps/',
		model: Activity_pubstepModel
	});

	module.setExports(Activity_pubsteps);
});
