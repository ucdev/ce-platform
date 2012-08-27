/*! app/collections/activities
* 	@requires: app,app/models/activity
* 	@extends: app.Collection
* 	@exports: app.collections.Activities
*/
define("app/collections/activities",["require","app","app/models"],function(require,app) {
	var ActivityModel = require("app/models/activity");

	var Activities = app.Collection.extend({
		url: '/activities/',
		model: ActivityModel
	});

	module.setExports(Activities);
});
