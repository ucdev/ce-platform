/*! app/collections/activity_credits
* 	@requires: app,app/models/activity_credit
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_credits
*/
define("app/collections/activity_credits",["require","app","app/models"],function(require,app) {
	var Activity_creditModel = require("app/models/activity_credit");

	var Activity_credits = app.Collection.extend({
		url: '/activity_credits/',
		model: Activity_creditModel
	});

	module.setExports(Activity_credits);
});
