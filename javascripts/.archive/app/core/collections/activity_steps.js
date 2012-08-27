/*! app/collections/activity_steps
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_steps
*/
define("app/collections/activity_steps",function(require,app) {
	var Activity_stepModel = require("app/models/activity_step");

	app.collections.Activity_steps = app.Collection.extend({
		url: '/activity_steps/',
		model: Activity_stepModel
	});

	exports.app = app;
});
