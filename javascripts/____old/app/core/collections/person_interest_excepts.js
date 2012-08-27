/*! app/collections/person_interest_excepts
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Person_interest_excepts
*/
define("app/collections/person_interest_excepts",function(require,app) {
	var Person_interest_exceptModel = require("app/models/person_interest_except");

	app.collections.Person_interest_excepts = app.Collection.extend({
		url: '/person_interest_excepts/',
		model: Person_interest_exceptModel
	});

	exports.app = app;
});
