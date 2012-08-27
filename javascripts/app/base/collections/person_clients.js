/*! app/collections/person_clients
* 	@requires: app,app/collection,app/models/person_client
* 	@extends: app.Collection
* 	@exports: app.collections.Person_clients
*/
define("app/collections/person_clients",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Person_clientModel = require("app/models/person_client");
	
	Person_clients = AppCollection.extend({
		url: '/person_clients/',
		model: Person_clientModel
	});

	module.setExports(Person_clients);
});
