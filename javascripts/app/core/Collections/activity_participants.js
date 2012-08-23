/*! app/core/collections/Activity_participants */
define("app/core/collections/Activity_participants",function() {
	var Activity_participants = Backbone.Collection.extend({
			url: '/activity_participants/',
			model: models.Activity_participant
		});

	exports.Activity_participants = Activity_participants;
});
