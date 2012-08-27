/*! app/collections/activity_pubsteps
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_pubsteps
*/
define("app/collections/activity_pubsteps",function(require,app) {
	var Activity_pubstepModel = require("app/models/activity_pubstep");

	app.collections.Activity_pubsteps = app.Collection.extend({
		url: '/activity_pubsteps/',
		model: Activity_pubstepModel
	});

	exports.app = app;
});
