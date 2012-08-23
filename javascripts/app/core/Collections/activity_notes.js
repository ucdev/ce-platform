/*! app/core/collections/Activity_notes */
define("app/core/collections/Activity_notes",function() {
	var Activity_notes = Backbone.Collection.extend({
			url: '/activity_notes/',
			model: models.Activity_note
		});

	exports.Activity_notes = Activity_notes;
});
