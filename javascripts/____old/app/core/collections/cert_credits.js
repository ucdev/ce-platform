/*! app/collections/cert_credits
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Cert_credits
*/
define("app/collections/cert_credits",function(require,app) {
	var Cert_creditModel = require("app/models/cert_credit");

	app.collections.Cert_credits = app.Collection.extend({
		url: '/cert_credits/',
		model: Cert_creditModel
	});

	exports.app = app;
});
