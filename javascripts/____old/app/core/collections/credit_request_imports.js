/*! app/collections/credit_request_imports
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Credit_request_imports
*/
define("app/collections/credit_request_imports",function(require,app) {
	var Credit_request_importModel = require("app/models/credit_request_import");

	app.collections.Credit_request_imports = app.Collection.extend({
		url: '/credit_request_imports/',
		model: Credit_request_importModel
	});

	exports.app = app;
});
