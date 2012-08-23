/*! app/core/collections/Activity_pubcomponents */
define("app/core/collections/Activity_pubcomponents",function() {
	var Activity_pubcomponents = Backbone.Collection.extend({
			url: '/activity_pubcomponents/',
			model: models.Activity_pubcomponent
		});

	exports.Activity_pubcomponents = Activity_pubcomponents;
});
