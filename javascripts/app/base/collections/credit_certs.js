/*! app/collections/credit_certs
* 	@requires: app,app/models/credit_cert
* 	@extends: app.Collection
* 	@exports: app.collections.Credit_certs
*/
define("app/collections/credit_certs",["require","app","app/models"],function(require,app) {
	var Credit_certModel = require("app/models/credit_cert");

	var Credit_certs = app.Collection.extend({
		url: '/credit_certs/',
		model: Credit_certModel
	});

	module.setExports(Credit_certs);
});
