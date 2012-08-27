/*! app/collections/attendee_steps
* 	@requires: app,app/collection,app/models/attendee_step
* 	@extends: app.Collection
* 	@exports: app.collections.Attendee_steps
*/
define("app/collections/attendee_steps",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Attendee_stepModel = require("app/models/attendee_step");
	
	Attendee_steps = AppCollection.extend({
		url: '/attendee_steps/',
		model: Attendee_stepModel
	});

	module.setExports(Attendee_steps);
});
