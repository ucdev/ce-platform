/*! app/collections/activity_steps
* 	@requires: app,app/models/activity_step
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_steps
*/
define("app/collections/activity_steps",["require","app","app/models"],function(require,app) {
	var Activity_stepModel = require("app/models/activity_step");

	var Activity_steps = app.Collection.extend({
		url: '/activity_steps/',
		model: Activity_stepModel
	});

	module.setExports(Activity_steps);
});
