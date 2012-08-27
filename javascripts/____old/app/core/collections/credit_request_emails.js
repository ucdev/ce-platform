/*! app/collections/credit_request_emails
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Credit_request_emails
*/
define("app/collections/credit_request_emails",function(require,app) {
	var Credit_request_emailModel = require("app/models/credit_request_email");

	app.collections.Credit_request_emails = app.Collection.extend({
		url: '/credit_request_emails/',
		model: Credit_request_emailModel
	});

	exports.app = app;
});
