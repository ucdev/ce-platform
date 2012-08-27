/*! app/collections/attendees
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Attendees
*/
define("app/collections/attendees",function(require,app) {
	var AttendeeModel = require("app/models/attendee");

	app.collections.Attendees = app.Collection.extend({
		url: '/attendees/',
		model: AttendeeModel
	});

	exports.app = app;
});
