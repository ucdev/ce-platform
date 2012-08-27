/*! app/collections/credit_request_imports
* 	@requires: app,app/collection,app/models/credit_request_import
* 	@extends: app.Collection
* 	@exports: app.collections.Credit_request_imports
*/
define("app/collections/credit_request_imports",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Credit_request_importModel = require("app/models/credit_request_import");
	
	Credit_request_imports = AppCollection.extend({
		url: '/credit_request_imports/',
		model: Credit_request_importModel
	});

	module.setExports(Credit_request_imports);
});
