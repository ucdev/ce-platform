/*! app/collections/attendee_phones
* 	@requires: app,app/models/attendee_phone
* 	@extends: app.Collection
* 	@exports: app.collections.Attendee_phones
*/
define("app/collections/attendee_phones",["require","app","app/models"],function(require,app) {
	var Attendee_phoneModel = require("app/models/attendee_phone");

	var Attendee_phones = app.Collection.extend({
		url: '/attendee_phones/',
		model: Attendee_phoneModel
	});

	module.setExports(Attendee_phones);
});
