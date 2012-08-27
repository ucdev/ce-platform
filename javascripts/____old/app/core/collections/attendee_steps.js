/*! app/collections/attendee_steps
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Attendee_steps
*/
define("app/collections/attendee_steps",function(require,app) {
	var Attendee_stepModel = require("app/models/attendee_step");

	app.collections.Attendee_steps = app.Collection.extend({
		url: '/attendee_steps/',
		model: Attendee_stepModel
	});

	exports.app = app;
});
