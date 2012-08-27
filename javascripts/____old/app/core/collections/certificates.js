/*! app/collections/certificates
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Certificates
*/
define("app/collections/certificates",function(require,app) {
	var CertificateModel = require("app/models/certificate");

	app.collections.Certificates = app.Collection.extend({
		url: '/certificates/',
		model: CertificateModel
	});

	exports.app = app;
});
