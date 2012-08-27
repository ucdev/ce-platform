/*! app/collections/person_specialtylms
* 	@requires: app,app/models/person_specialtylm
* 	@extends: app.Collection
* 	@exports: app.collections.Person_specialtylms
*/
define("app/collections/person_specialtylms",["require","app","app/models"],function(require,app) {
	var Person_specialtylmModel = require("app/models/person_specialtylm");

	var Person_specialtylms = app.Collection.extend({
		url: '/person_specialtylms/',
		model: Person_specialtylmModel
	});

	module.setExports(Person_specialtylms);
});
