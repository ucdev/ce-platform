/*! app/collections/credit_requests
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Credit_requests
*/
define("app/collections/credit_requests",function(require,app) {
	var Credit_requestModel = require("app/models/credit_request");

	app.collections.Credit_requests = app.Collection.extend({
		url: '/credit_requests/',
		model: Credit_requestModel
	});

	exports.app = app;
});
