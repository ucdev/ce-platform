/*! app/collections/person_interest_excepts
* 	@requires: app,app/models/person_interest_except
* 	@extends: app.Collection
* 	@exports: app.collections.Person_interest_excepts
*/
define("app/collections/person_interest_excepts",["require","app","app/models"],function(require,app) {
	var Person_interest_exceptModel = require("app/models/person_interest_except");

	var Person_interest_excepts = app.Collection.extend({
		url: '/person_interest_excepts/',
		model: Person_interest_exceptModel
	});

	module.setExports(Person_interest_excepts);
});
