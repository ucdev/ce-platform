/*! app/collections/person_specialtylms
* 	@requires: app,app/collection,app/models/person_specialtylm
* 	@extends: app.Collection
* 	@exports: app.collections.Person_specialtylms
*/
define("app/collections/person_specialtylms",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Person_specialtylmModel = require("app/models/person_specialtylm");
	
	Person_specialtylms = AppCollection.extend({
		url: '/person_specialtylms/',
		model: Person_specialtylmModel
	});

	module.setExports(Person_specialtylms);
});
