/*! app/collections/people
* 	@requires: app,app/collection,app/models/person
* 	@extends: app.Collection
* 	@exports: app.collections.People
*/
define("app/collections/people",["require"],function(require) {
	var AppCollection = require("app/collection");
	var PersonModel = require("app/models/person");
	
	People = AppCollection.extend({
		url: '/people/',
		model: PersonModel
	});

	module.setExports(People);
});
