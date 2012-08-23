/*! app/core/collections/Processstep_activities */
define("app/core/collections/Processstep_activities",function() {
	var Processstep_activities = Backbone.Collection.extend({
			url: '/processstep_activities/',
			model: models.Processstep_activity
		});

	exports.Processstep_activities = Processstep_activities;
});
