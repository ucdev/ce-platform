/*! app/collections/activity_publishes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_publishes
*/
define("app/collections/activity_publishes",function(require,app) {
	var Activity_publishModel = require("app/models/activity_publish");

	app.collections.Activity_publishes = app.Collection.extend({
		url: '/activity_publishes/',
		model: Activity_publishModel
	});

	exports.app = app;
});
