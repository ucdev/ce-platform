/*! app/collections/credit_requests
* 	@requires: app,app/collection,app/models/credit_request
* 	@extends: app.Collection
* 	@exports: app.collections.Credit_requests
*/
define("app/collections/credit_requests",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Credit_requestModel = require("app/models/credit_request");
	
	Credit_requests = AppCollection.extend({
		url: '/credit_requests/',
		model: Credit_requestModel
	});

	module.setExports(Credit_requests);
});
