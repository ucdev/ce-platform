/*! app/collections/processstep_activities
* 	@requires: app,app/collection,app/models/processstep_activity
* 	@extends: app.Collection
* 	@exports: app.collections.Processstep_activities
*/
define("app/collections/processstep_activities",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Processstep_activityModel = require("app/models/processstep_activity");
	
	Processstep_activities = AppCollection.extend({
		url: '/processstep_activities/',
		model: Processstep_activityModel
	});

	module.setExports(Processstep_activities);
});
