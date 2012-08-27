/*! app/collections/person_degrees
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Person_degrees
*/
define("app/collections/person_degrees",function(require,app) {
	var Person_degreeModel = require("app/models/person_degree");

	app.collections.Person_degrees = app.Collection.extend({
		url: '/person_degrees/',
		model: Person_degreeModel
	});

	exports.app = app;
});
