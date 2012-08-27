/*! app/collections/person_specialtylms
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Person_specialtylms
*/
define("app/collections/person_specialtylms",function(require,app) {
	var Person_specialtylmModel = require("app/models/person_specialtylm");

	app.collections.Person_specialtylms = app.Collection.extend({
		url: '/person_specialtylms/',
		model: Person_specialtylmModel
	});

	exports.app = app;
});
