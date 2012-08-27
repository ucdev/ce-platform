/*! app/collections/people
* 	@requires: app,app/models/person
* 	@extends: app.Collection
* 	@exports: app.collections.People
*/
define("app/collections/people",["require","app","app/models"],function(require,app) {
	var PersonModel = require("app/models/person");

	var People = app.Collection.extend({
		url: '/people/',
		model: PersonModel
	});

	module.setExports(People);
});
