/*! app/collections/person_addresses
* 	@requires: app,app/models/person_address
* 	@extends: app.Collection
* 	@exports: app.collections.Person_addresses
*/
define("app/collections/person_addresses",["require","app","app/models"],function(require,app) {
	var Person_addressModel = require("app/models/person_address");

	var Person_addresses = app.Collection.extend({
		url: '/person_addresses/',
		model: Person_addressModel
	});

	module.setExports(Person_addresses);
});
