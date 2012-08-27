/*! app/collections/attendee_steps
* 	@requires: app,app/models/attendee_step
* 	@extends: app.Collection
* 	@exports: app.collections.Attendee_steps
*/
define("app/collections/attendee_steps",["require","app","app/models"],function(require,app) {
	var Attendee_stepModel = require("app/models/attendee_step");

	var Attendee_steps = app.Collection.extend({
		url: '/attendee_steps/',
		model: Attendee_stepModel
	});

	module.setExports(Attendee_steps);
});
