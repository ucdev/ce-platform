/*! app/core/collections/Activity_containers */
define("app/core/collections/Activity_containers",function() {
	var Activity_containers = Backbone.Collection.extend({
			url: '/activity_containers/',
			model: models.Activity_container
		});

	exports.Activity_containers = Activity_containers;
});
