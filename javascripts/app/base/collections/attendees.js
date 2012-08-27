/*! app/collections/attendees
* 	@requires: app,app/collection,app/models/attendee
* 	@extends: app.Collection
* 	@exports: app.collections.Attendees
*/
define("app/collections/attendees",["require"],function(require) {
	var AppCollection = require("app/collection");
	var AttendeeModel = require("app/models/attendee");
	
	Attendees = AppCollection.extend({
		url: '/attendees/',
		model: AttendeeModel
	});

	module.setExports(Attendees);
});
