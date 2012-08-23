/*! app/core/collections/Activity_publishes */
define("app/core/collections/Activity_publishes",function() {
	var Activity_publishes = Backbone.Collection.extend({
			url: '/activity_publishes/',
			model: models.Activity_publish
		});

	exports.Activity_publishes = Activity_publishes;
});
