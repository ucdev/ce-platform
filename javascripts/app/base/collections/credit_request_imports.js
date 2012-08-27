/*! app/collections/credit_request_imports
* 	@requires: app,app/models/credit_request_import
* 	@extends: app.Collection
* 	@exports: app.collections.Credit_request_imports
*/
define("app/collections/credit_request_imports",["require","app","app/models"],function(require,app) {
	var Credit_request_importModel = require("app/models/credit_request_import");

	var Credit_request_imports = app.Collection.extend({
		url: '/credit_request_imports/',
		model: Credit_request_importModel
	});

	module.setExports(Credit_request_imports);
});
