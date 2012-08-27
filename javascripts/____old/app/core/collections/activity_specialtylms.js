/*! app/collections/activity_specialtylms
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_specialtylms
*/
define("app/collections/activity_specialtylms",function(require,app) {
	var Activity_specialtylmModel = require("app/models/activity_specialtylm");

	app.collections.Activity_specialtylms = app.Collection.extend({
		url: '/activity_specialtylms/',
		model: Activity_specialtylmModel
	});

	exports.app = app;
});
