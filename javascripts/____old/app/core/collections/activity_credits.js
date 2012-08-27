/*! app/collections/activity_credits
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_credits
*/
define("app/collections/activity_credits",function(require,app) {
	var Activity_creditModel = require("app/models/activity_credit");

	app.collections.Activity_credits = app.Collection.extend({
		url: '/activity_credits/',
		model: Activity_creditModel
	});

	exports.app = app;
});
