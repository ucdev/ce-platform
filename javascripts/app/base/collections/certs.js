/*! app/collections/certs
* 	@requires: app,app/models/cert
* 	@extends: app.Collection
* 	@exports: app.collections.Certs
*/
define("app/collections/certs",["require","app","app/models"],function(require,app) {
	var CertModel = require("app/models/cert");

	var Certs = app.Collection.extend({
		url: '/certs/',
		model: CertModel
	});

	module.setExports(Certs);
});
