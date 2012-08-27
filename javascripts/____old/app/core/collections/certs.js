/*! app/collections/certs
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Certs
*/
define("app/collections/certs",function(require,app) {
	var CertModel = require("app/models/cert");

	app.collections.Certs = app.Collection.extend({
		url: '/certs/',
		model: CertModel
	});

	exports.app = app;
});
