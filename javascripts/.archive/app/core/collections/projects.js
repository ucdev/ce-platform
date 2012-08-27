/*! app/collections/projects
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Projects
*/
define("app/collections/projects",function(require,app) {
	var ProjectModel = require("app/models/project");

	app.collections.Projects = app.Collection.extend({
		url: '/projects/',
		model: ProjectModel
	});

	exports.app = app;
});
