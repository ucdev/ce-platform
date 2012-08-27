/*! app/collections/activities
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activities
*/
define("app/collections/activities",function(require,app) {
	var ActivityModel = require("app/models/activity");

	app.collections.Activities = app.Collection.extend({
		url: '/activities/',
		model: ActivityModel
	});

	exports.app = app;
});
