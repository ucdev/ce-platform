/*! app/collections/projects
* 	@requires: app,app/collection,app/models/project
* 	@extends: app.Collection
* 	@exports: app.collections.Projects
*/
define("app/collections/projects",["require"],function(require) {
	var AppCollection = require("app/collection");
	var ProjectModel = require("app/models/project");
	
	Projects = AppCollection.extend({
		url: '/projects/',
		model: ProjectModel
	});

	module.setExports(Projects);
});
