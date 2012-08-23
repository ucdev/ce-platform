/*! app/core/collections/Activity_committees */
define("app/core/collections/Activity_committees",function() {
	var Activity_committees = Backbone.Collection.extend({
			url: '/activity_committees/',
			model: models.Activity_committee
		});

	exports.Activity_committees = Activity_committees;
});
