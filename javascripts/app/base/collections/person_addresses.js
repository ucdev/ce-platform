/*! app/collections/person_addresses
* 	@requires: app,app/collection,app/models/person_address
* 	@extends: app.Collection
* 	@exports: app.collections.Person_addresses
*/
define("app/collections/person_addresses",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Person_addressModel = require("app/models/person_address");
	
	Person_addresses = AppCollection.extend({
		url: '/person_addresses/',
		model: Person_addressModel
	});

	module.setExports(Person_addresses);
});
