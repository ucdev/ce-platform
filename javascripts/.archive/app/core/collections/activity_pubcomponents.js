/*! app/collections/activity_pubcomponents
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_pubcomponents
*/
define("app/collections/activity_pubcomponents",function(require,app) {
	var Activity_pubcomponentModel = require("app/models/activity_pubcomponent");

	app.collections.Activity_pubcomponents = app.Collection.extend({
		url: '/activity_pubcomponents/',
		model: Activity_pubcomponentModel
	});

	exports.app = app;
});
