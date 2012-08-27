/*! app/collections/credit_certs
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Credit_certs
*/
define("app/collections/credit_certs",function(require,app) {
	var Credit_certModel = require("app/models/credit_cert");

	app.collections.Credit_certs = app.Collection.extend({
		url: '/credit_certs/',
		model: Credit_certModel
	});

	exports.app = app;
});
