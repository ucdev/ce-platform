/*! app/collections/activity_finbudgets
* 	@requires: app,app/collection,app/models/activity_finbudget
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_finbudgets
*/
define("app/collections/activity_finbudgets",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_finbudgetModel = require("app/models/activity_finbudget");
	
	Activity_finbudgets = AppCollection.extend({
		url: '/activity_finbudgets/',
		model: Activity_finbudgetModel
	});

	module.setExports(Activity_finbudgets);
});
