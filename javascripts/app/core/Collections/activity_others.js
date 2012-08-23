/*! app/core/collections/Activity_others */
define("app/core/collections/Activity_others",function() {
	var Activity_others = Backbone.Collection.extend({
			url: '/activity_others/',
			model: models.Activity_other
		});

	exports.Activity_others = Activity_others;
});
