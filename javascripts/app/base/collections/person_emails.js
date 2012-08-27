/*! app/collections/person_emails
* 	@requires: app,app/models/person_email
* 	@extends: app.Collection
* 	@exports: app.collections.Person_emails
*/
define("app/collections/person_emails",["require","app","app/models"],function(require,app) {
	var Person_emailModel = require("app/models/person_email");

	var Person_emails = app.Collection.extend({
		url: '/person_emails/',
		model: Person_emailModel
	});

	module.setExports(Person_emails);
});
