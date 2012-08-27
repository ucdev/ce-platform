/*! app/collections/entity_activities
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_activities
*/
define("app/collections/entity_activities",function(require,app) {
	var Entity_activityModel = require("app/models/entity_activity");

	app.collections.Entity_activities = app.Collection.extend({
		url: '/entity_activities/',
		model: Entity_activityModel
	});

	exports.app = app;
});
