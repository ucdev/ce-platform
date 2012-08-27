/*! app/collections/entity_activities
* 	@requires: app,app/models/entity_activity
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_activities
*/
define("app/collections/entity_activities",["require","app","app/models"],function(require,app) {
	var Entity_activityModel = require("app/models/entity_activity");

	var Entity_activities = app.Collection.extend({
		url: '/entity_activities/',
		model: Entity_activityModel
	});

	module.setExports(Entity_activities);
});
