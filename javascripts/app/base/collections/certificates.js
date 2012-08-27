/*! app/collections/certificates
* 	@requires: app,app/collection,app/models/certificate
* 	@extends: app.Collection
* 	@exports: app.collections.Certificates
*/
define("app/collections/certificates",["require"],function(require) {
	var AppCollection = require("app/collection");
	var CertificateModel = require("app/models/certificate");
	
	Certificates = AppCollection.extend({
		url: '/certificates/',
		model: CertificateModel
	});

	module.setExports(Certificates);
});
