/*! app/collections/people
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.People
*/
define("app/collections/people",function(require,app) {
	var PersonModel = require("app/models/person");

	app.collections.People = app.Collection.extend({
		url: '/people/',
		model: PersonModel
	});

	exports.app = app;
});
