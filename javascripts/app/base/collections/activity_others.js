/*! app/collections/activity_others
* 	@requires: app,app/collection,app/models/activity_other
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_others
*/
define("app/collections/activity_others",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_otherModel = require("app/models/activity_other");
	
	Activity_others = AppCollection.extend({
		url: '/activity_others/',
		model: Activity_otherModel
	});

	module.setExports(Activity_others);
});
