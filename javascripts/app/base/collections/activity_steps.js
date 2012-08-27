/*! app/collections/activity_steps
* 	@requires: app,app/collection,app/models/activity_step
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_steps
*/
define("app/collections/activity_steps",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_stepModel = require("app/models/activity_step");
	
	Activity_steps = AppCollection.extend({
		url: '/activity_steps/',
		model: Activity_stepModel
	});

	module.setExports(Activity_steps);
});
