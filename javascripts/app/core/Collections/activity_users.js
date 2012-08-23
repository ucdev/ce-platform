/*! app/core/collections/Activity_users */
define("app/core/collections/Activity_users",function() {
	var Activity_users = Backbone.Collection.extend({
			url: '/activity_users/',
			model: models.Activity_user
		});

	exports.Activity_users = Activity_users;
});
