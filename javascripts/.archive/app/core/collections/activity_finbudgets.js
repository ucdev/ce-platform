/*! app/collections/activity_finbudgets
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_finbudgets
*/
define("app/collections/activity_finbudgets",function(require,app) {
	var Activity_finbudgetModel = require("app/models/activity_finbudget");

	app.collections.Activity_finbudgets = app.Collection.extend({
		url: '/activity_finbudgets/',
		model: Activity_finbudgetModel
	});

	exports.app = app;
});
