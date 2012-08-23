/*! app/core/collections/Activity_tags */
define("app/core/collections/Activity_tags",function() {
	var Activity_tags = Backbone.Collection.extend({
			url: '/activity_tags/',
			model: models.Activity_tag
		});

	exports.Activity_tags = Activity_tags;
});
