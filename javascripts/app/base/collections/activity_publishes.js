/*! app/collections/activity_publishes
* 	@requires: app,app/models/activity_publish
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_publishes
*/
define("app/collections/activity_publishes",["require","app","app/models"],function(require,app) {
	var Activity_publishModel = require("app/models/activity_publish");

	var Activity_publishes = app.Collection.extend({
		url: '/activity_publishes/',
		model: Activity_publishModel
	});

	module.setExports(Activity_publishes);
});
