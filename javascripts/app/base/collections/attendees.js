/*! app/collections/attendees
* 	@requires: app,app/models/attendee
* 	@extends: app.Collection
* 	@exports: app.collections.Attendees
*/
define("app/collections/attendees",["require","app","app/models"],function(require,app) {
	var AttendeeModel = require("app/models/attendee");

	var Attendees = app.Collection.extend({
		url: '/attendees/',
		model: AttendeeModel
	});

	module.setExports(Attendees);
});
