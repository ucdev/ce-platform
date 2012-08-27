/*! app/collections/activity_others
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_others
*/
define("app/collections/activity_others",function(require,app) {
	var Activity_otherModel = require("app/models/activity_other");

	app.collections.Activity_others = app.Collection.extend({
		url: '/activity_others/',
		model: Activity_otherModel
	});

	exports.app = app;
});
