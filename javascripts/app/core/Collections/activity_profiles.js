/*! app/core/collections/Activity_profiles */
define("app/core/collections/Activity_profiles",function() {
	var Activity_profiles = Backbone.Collection.extend({
			url: '/activity_profiles/',
			model: models.Activity_profile
		});

	exports.Activity_profiles = Activity_profiles;
});
