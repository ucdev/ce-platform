/*! app/collections/person_degrees
* 	@requires: app,app/collection,app/models/person_degree
* 	@extends: app.Collection
* 	@exports: app.collections.Person_degrees
*/
define("app/collections/person_degrees",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Person_degreeModel = require("app/models/person_degree");
	
	Person_degrees = AppCollection.extend({
		url: '/person_degrees/',
		model: Person_degreeModel
	});

	module.setExports(Person_degrees);
});
