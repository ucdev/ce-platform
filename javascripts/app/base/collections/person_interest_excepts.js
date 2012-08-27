/*! app/collections/person_interest_excepts
* 	@requires: app,app/collection,app/models/person_interest_except
* 	@extends: app.Collection
* 	@exports: app.collections.Person_interest_excepts
*/
define("app/collections/person_interest_excepts",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Person_interest_exceptModel = require("app/models/person_interest_except");
	
	Person_interest_excepts = AppCollection.extend({
		url: '/person_interest_excepts/',
		model: Person_interest_exceptModel
	});

	module.setExports(Person_interest_excepts);
});
