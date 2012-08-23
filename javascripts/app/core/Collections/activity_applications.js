/*! app/core/collections/Activity_applications */
define("app/core/collections/Activity_applications",function() {
	var Activity_applications = Backbone.Collection.extend({
			url: '/activity_applications/',
			model: models.Activity_application
		});

	exports.Activity_applications = Activity_applications;
});
