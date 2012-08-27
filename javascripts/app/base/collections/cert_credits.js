/*! app/collections/cert_credits
* 	@requires: app,app/models/cert_credit
* 	@extends: app.Collection
* 	@exports: app.collections.Cert_credits
*/
define("app/collections/cert_credits",["require","app","app/models"],function(require,app) {
	var Cert_creditModel = require("app/models/cert_credit");

	var Cert_credits = app.Collection.extend({
		url: '/cert_credits/',
		model: Cert_creditModel
	});

	module.setExports(Cert_credits);
});
