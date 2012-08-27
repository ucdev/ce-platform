/*! app/collections/certs
* 	@requires: app,app/collection,app/models/cert
* 	@extends: app.Collection
* 	@exports: app.collections.Certs
*/
define("app/collections/certs",["require"],function(require) {
	var AppCollection = require("app/collection");
	var CertModel = require("app/models/cert");
	
	Certs = AppCollection.extend({
		url: '/certs/',
		model: CertModel
	});

	module.setExports(Certs);
});
