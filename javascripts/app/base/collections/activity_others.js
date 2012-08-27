/*! app/collections/activity_others
* 	@requires: app,app/models/activity_other
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_others
*/
define("app/collections/activity_others",["require","app","app/models"],function(require,app) {
	var Activity_otherModel = require("app/models/activity_other");

	var Activity_others = app.Collection.extend({
		url: '/activity_others/',
		model: Activity_otherModel
	});

	module.setExports(Activity_others);
});
