/*! app/collections/attendee_addresses
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Attendee_addresses
*/
define("app/collections/attendee_addresses",function(require,app) {
	var Attendee_addressModel = require("app/models/attendee_address");

	app.collections.Attendee_addresses = app.Collection.extend({
		url: '/attendee_addresses/',
		model: Attendee_addressModel
	});

	exports.app = app;
});
