/*! app/collections/person_addresses
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Person_addresses
*/
define("app/collections/person_addresses",function(require,app) {
	var Person_addressModel = require("app/models/person_address");

	app.collections.Person_addresses = app.Collection.extend({
		url: '/person_addresses/',
		model: Person_addressModel
	});

	exports.app = app;
});
