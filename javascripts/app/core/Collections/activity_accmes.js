/*! app/core/collections/Activity_accmes */
define("app/core/collections/Activity_accmes",function() {
	var Activity_accmes = Backbone.Collection.extend({
			url: '/activity_accmes/',
			model: models.Activity_accme
		});

	exports.Activity_accmes = Activity_accmes;
});
