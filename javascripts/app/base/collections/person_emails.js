/*! app/collections/person_emails
* 	@requires: app,app/collection,app/models/person_email
* 	@extends: app.Collection
* 	@exports: app.collections.Person_emails
*/
define("app/collections/person_emails",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Person_emailModel = require("app/models/person_email");
	
	Person_emails = AppCollection.extend({
		url: '/person_emails/',
		model: Person_emailModel
	});

	module.setExports(Person_emails);
});
