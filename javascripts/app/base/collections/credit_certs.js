/*! app/collections/credit_certs
* 	@requires: app,app/collection,app/models/credit_cert
* 	@extends: app.Collection
* 	@exports: app.collections.Credit_certs
*/
define("app/collections/credit_certs",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Credit_certModel = require("app/models/credit_cert");
	
	Credit_certs = AppCollection.extend({
		url: '/credit_certs/',
		model: Credit_certModel
	});

	module.setExports(Credit_certs);
});
