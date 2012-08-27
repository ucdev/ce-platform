/*! app/collections/cert_credits
* 	@requires: app,app/collection,app/models/cert_credit
* 	@extends: app.Collection
* 	@exports: app.collections.Cert_credits
*/
define("app/collections/cert_credits",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Cert_creditModel = require("app/models/cert_credit");
	
	Cert_credits = AppCollection.extend({
		url: '/cert_credits/',
		model: Cert_creditModel
	});

	module.setExports(Cert_credits);
});
