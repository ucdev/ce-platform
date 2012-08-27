/*! app/collections/projects
* 	@requires: app,app/models/project
* 	@extends: app.Collection
* 	@exports: app.collections.Projects
*/
define("app/collections/projects",["require","app","app/models"],function(require,app) {
	var ProjectModel = require("app/models/project");

	var Projects = app.Collection.extend({
		url: '/projects/',
		model: ProjectModel
	});

	module.setExports(Projects);
});
