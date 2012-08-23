/*! app/core/collections/Projects */
define("app/core/collections/Projects",function() {
	var Projects = Backbone.Collection.extend({
			url: '/projects/',
			model: models.Project
		});

	exports.Projects = Projects;
});
