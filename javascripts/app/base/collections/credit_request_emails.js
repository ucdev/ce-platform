/*! app/collections/credit_request_emails
* 	@requires: app,app/collection,app/models/credit_request_email
* 	@extends: app.Collection
* 	@exports: app.collections.Credit_request_emails
*/
define("app/collections/credit_request_emails",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Credit_request_emailModel = require("app/models/credit_request_email");
	
	Credit_request_emails = AppCollection.extend({
		url: '/credit_request_emails/',
		model: Credit_request_emailModel
	});

	module.setExports(Credit_request_emails);
});
