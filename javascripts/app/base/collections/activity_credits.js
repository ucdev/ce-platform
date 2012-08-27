/*! app/collections/activity_credits
* 	@requires: app,app/collection,app/models/activity_credit
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_credits
*/
define("app/collections/activity_credits",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_creditModel = require("app/models/activity_credit");
	
	Activity_credits = AppCollection.extend({
		url: '/activity_credits/',
		model: Activity_creditModel
	});

	module.setExports(Activity_credits);
});
