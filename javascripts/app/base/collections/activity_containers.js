/*! app/collections/activity_containers
* 	@requires: app,app/models/activity_container
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_containers
*/
define("app/collections/activity_containers",["require","app","app/models"],function(require,app) {
	var Activity_containerModel = require("app/models/activity_container");

	var Activity_containers = app.Collection.extend({
		url: '/activity_containers/',
		model: Activity_containerModel
	});

	module.setExports(Activity_containers);
});
