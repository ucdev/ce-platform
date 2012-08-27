/*! app/collections/activity_finfees
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_finfees
*/
define("app/collections/activity_finfees",function(require,app) {
	var Activity_finfeeModel = require("app/models/activity_finfee");

	app.collections.Activity_finfees = app.Collection.extend({
		url: '/activity_finfees/',
		model: Activity_finfeeModel
	});

	exports.app = app;
});
