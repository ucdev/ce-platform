/*! app/core/collections/Activity_steps */
define("app/core/collections/Activity_steps",function() {
	var Activity_steps = Backbone.Collection.extend({
			url: '/activity_steps/',
			model: models.Activity_step
		});

	exports.Activity_steps = Activity_steps;
});
