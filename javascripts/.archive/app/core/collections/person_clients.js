/*! app/collections/person_clients
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Person_clients
*/
define("app/collections/person_clients",function(require,app) {
	var Person_clientModel = require("app/models/person_client");

	app.collections.Person_clients = app.Collection.extend({
		url: '/person_clients/',
		model: Person_clientModel
	});

	exports.app = app;
});
