/*! app/collections/entity_activities
* 	@requires: app,app/collection,app/models/entity_activity
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_activities
*/
define("app/collections/entity_activities",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Entity_activityModel = require("app/models/entity_activity");
	
	Entity_activities = AppCollection.extend({
		url: '/entity_activities/',
		model: Entity_activityModel
	});

	module.setExports(Entity_activities);
});
