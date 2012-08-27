/*! app/collections/activity_containers
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_containers
*/
define("app/collections/activity_containers",function(require,app) {
	var Activity_containerModel = require("app/models/activity_container");

	app.collections.Activity_containers = app.Collection.extend({
		url: '/activity_containers/',
		model: Activity_containerModel
	});

	exports.app = app;
});
