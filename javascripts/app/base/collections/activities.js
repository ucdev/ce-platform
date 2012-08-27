/*! app/collections/activities
* 	@requires: app,app/collection,app/models/activity
* 	@extends: app.Collection
* 	@exports: app.collections.Activities
*/
define("app/collections/activities",["require"],function(require) {
	var AppCollection = require("app/collection");
	var ActivityModel = require("app/models/activity");
	
	Activities = AppCollection.extend({
		url: '/activities/',
		model: ActivityModel
	});

	module.setExports(Activities);
});
