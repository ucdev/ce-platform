/*! app/core/collections/Activity_sites */
define("app/core/collections/Activity_sites",function() {
	var Activity_sites = Backbone.Collection.extend({
			url: '/activity_sites/',
			model: models.Activity_site
		});

	exports.Activity_sites = Activity_sites;
});
