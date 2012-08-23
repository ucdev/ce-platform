/*! app/core/collections/Entity_activities */
define("app/core/collections/Entity_activities",function() {
	var Entity_activities = Backbone.Collection.extend({
			url: '/entity_activities/',
			model: models.Entity_activity
		});

	exports.Entity_activities = Entity_activities;
});
