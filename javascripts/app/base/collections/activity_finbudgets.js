/*! app/collections/activity_finbudgets
* 	@requires: app,app/models/activity_finbudget
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_finbudgets
*/
define("app/collections/activity_finbudgets",["require","app","app/models"],function(require,app) {
	var Activity_finbudgetModel = require("app/models/activity_finbudget");

	var Activity_finbudgets = app.Collection.extend({
		url: '/activity_finbudgets/',
		model: Activity_finbudgetModel
	});

	module.setExports(Activity_finbudgets);
});
