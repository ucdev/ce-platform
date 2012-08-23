/*! app/core/collections/Activity_pubsteps */
define("app/core/collections/Activity_pubsteps",function() {
	var Activity_pubsteps = Backbone.Collection.extend({
			url: '/activity_pubsteps/',
			model: models.Activity_pubstep
		});

	exports.Activity_pubsteps = Activity_pubsteps;
});
