/*! app/collections/certificates
* 	@requires: app,app/models/certificate
* 	@extends: app.Collection
* 	@exports: app.collections.Certificates
*/
define("app/collections/certificates",["require","app","app/models"],function(require,app) {
	var CertificateModel = require("app/models/certificate");

	var Certificates = app.Collection.extend({
		url: '/certificates/',
		model: CertificateModel
	});

	module.setExports(Certificates);
});
