/*! app/collections/person_degrees
* 	@requires: app,app/models/person_degree
* 	@extends: app.Collection
* 	@exports: app.collections.Person_degrees
*/
define("app/collections/person_degrees",["require","app","app/models"],function(require,app) {
	var Person_degreeModel = require("app/models/person_degree");

	var Person_degrees = app.Collection.extend({
		url: '/person_degrees/',
		model: Person_degreeModel
	});

	module.setExports(Person_degrees);
});
