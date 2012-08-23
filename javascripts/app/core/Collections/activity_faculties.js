/*! app/core/collections/Activity_faculties */
define("app/core/collections/Activity_faculties",function() {
	var Activity_faculties = Backbone.Collection.extend({
			url: '/activity_faculties/',
			model: models.Activity_faculty
		});

	exports.Activity_faculties = Activity_faculties;
});
