/*! app/collections/person_emails
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Person_emails
*/
define("app/collections/person_emails",function(require,app) {
	var Person_emailModel = require("app/models/person_email");

	app.collections.Person_emails = app.Collection.extend({
		url: '/person_emails/',
		model: Person_emailModel
	});

	exports.app = app;
});
