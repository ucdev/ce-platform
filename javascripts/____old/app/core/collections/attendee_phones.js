/*! app/collections/attendee_phones
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Attendee_phones
*/
define("app/collections/attendee_phones",function(require,app) {
	var Attendee_phoneModel = require("app/models/attendee_phone");

	app.collections.Attendee_phones = app.Collection.extend({
		url: '/attendee_phones/',
		model: Attendee_phoneModel
	});

	exports.app = app;
});
