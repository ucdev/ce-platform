/*! app/core/collections/Activity_votes */
define("app/core/collections/Activity_votes",function() {
	var Activity_votes = Backbone.Collection.extend({
			url: '/activity_votes/',
			model: models.Activity_vote
		});

	exports.Activity_votes = Activity_votes;
});
