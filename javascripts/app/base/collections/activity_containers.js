/*! app/collections/activity_containers
* 	@requires: app,app/collection,app/models/activity_container
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_containers
*/
define("app/collections/activity_containers",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_containerModel = require("app/models/activity_container");
	
	Activity_containers = AppCollection.extend({
		url: '/activity_containers/',
		model: Activity_containerModel
	});

	module.setExports(Activity_containers);
});
