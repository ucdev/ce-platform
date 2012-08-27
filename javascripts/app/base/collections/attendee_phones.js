/*! app/collections/attendee_phones
* 	@requires: app,app/collection,app/models/attendee_phone
* 	@extends: app.Collection
* 	@exports: app.collections.Attendee_phones
*/
define("app/collections/attendee_phones",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Attendee_phoneModel = require("app/models/attendee_phone");
	
	Attendee_phones = AppCollection.extend({
		url: '/attendee_phones/',
		model: Attendee_phoneModel
	});

	module.setExports(Attendee_phones);
});
