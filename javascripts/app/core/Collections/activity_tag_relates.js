/*! app/core/collections/Activity_tag_relates */
define("app/core/collections/Activity_tag_relates",function() {
	var Activity_tag_relates = Backbone.Collection.extend({
			url: '/activity_tag_relates/',
			model: models.Activity_tag_relate
		});

	exports.Activity_tag_relates = Activity_tag_relates;
});
