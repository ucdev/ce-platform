/*! app/collections/person_clients
* 	@requires: app,app/models/person_client
* 	@extends: app.Collection
* 	@exports: app.collections.Person_clients
*/
define("app/collections/person_clients",["require","app","app/models"],function(require,app) {
	var Person_clientModel = require("app/models/person_client");

	var Person_clients = app.Collection.extend({
		url: '/person_clients/',
		model: Person_clientModel
	});

	module.setExports(Person_clients);
});
