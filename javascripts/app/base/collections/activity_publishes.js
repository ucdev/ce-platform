/*! app/collections/activity_publishes
* 	@requires: app,app/collection,app/models/activity_publish
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_publishes
*/
define("app/collections/activity_publishes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_publishModel = require("app/models/activity_publish");
	
	Activity_publishes = AppCollection.extend({
		url: '/activity_publishes/',
		model: Activity_publishModel
	});

	module.setExports(Activity_publishes);
});
