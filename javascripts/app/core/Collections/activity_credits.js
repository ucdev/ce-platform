/*! app/core/collections/Activity_credits */
define("app/core/collections/Activity_credits",function() {
	var Activity_credits = Backbone.Collection.extend({
			url: '/activity_credits/',
			model: models.Activity_credit
		});

	exports.Activity_credits = Activity_credits;
});
