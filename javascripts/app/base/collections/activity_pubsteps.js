/*! app/collections/activity_pubsteps
* 	@requires: app,app/models/activity_pubstep
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_pubsteps
*/
define("app/collections/activity_pubsteps",["require","app","app/models"],function(require,app) {
	var Activity_pubstepModel = require("app/models/activity_pubstep");

	var Activity_pubsteps = app.Collection.extend({
		url: '/activity_pubsteps/',
		model: Activity_pubstepModel
	});

	module.setExports(Activity_pubsteps);
});
