/*! app/collections/credit_requests
* 	@requires: app,app/models/credit_request
* 	@extends: app.Collection
* 	@exports: app.collections.Credit_requests
*/
define("app/collections/credit_requests",["require","app","app/models"],function(require,app) {
	var Credit_requestModel = require("app/models/credit_request");

	var Credit_requests = app.Collection.extend({
		url: '/credit_requests/',
		model: Credit_requestModel
	});

	module.setExports(Credit_requests);
});
