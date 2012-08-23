/*! app/core/collections/Activity_comments */
define("app/core/collections/Activity_comments",function() {
	var Activity_comments = Backbone.Collection.extend({
			url: '/activity_comments/',
			model: models.Activity_comment
		});

	exports.Activity_comments = Activity_comments;
});
