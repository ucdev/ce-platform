/*! app/core/collections/Activity_finfees */
define("app/core/collections/Activity_finfees",function() {
	var Activity_finfees = Backbone.Collection.extend({
			url: '/activity_finfees/',
			model: models.Activity_finfee
		});

	exports.Activity_finfees = Activity_finfees;
});
