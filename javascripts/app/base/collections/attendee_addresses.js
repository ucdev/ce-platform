/*! app/collections/attendee_addresses
* 	@requires: app,app/collection,app/models/attendee_address
* 	@extends: app.Collection
* 	@exports: app.collections.Attendee_addresses
*/
define("app/collections/attendee_addresses",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Attendee_addressModel = require("app/models/attendee_address");
	
	Attendee_addresses = AppCollection.extend({
		url: '/attendee_addresses/',
		model: Attendee_addressModel
	});

	module.setExports(Attendee_addresses);
});
