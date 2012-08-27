/*! app/collections/attendee_addresses
* 	@requires: app,app/models/attendee_address
* 	@extends: app.Collection
* 	@exports: app.collections.Attendee_addresses
*/
define("app/collections/attendee_addresses",["require","app","app/models"],function(require,app) {
	var Attendee_addressModel = require("app/models/attendee_address");

	var Attendee_addresses = app.Collection.extend({
		url: '/attendee_addresses/',
		model: Attendee_addressModel
	});

	module.setExports(Attendee_addresses);
});
