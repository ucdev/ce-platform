/*! app/collections/activity_finfees
* 	@requires: app,app/models/activity_finfee
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_finfees
*/
define("app/collections/activity_finfees",["require","app","app/models"],function(require,app) {
	var Activity_finfeeModel = require("app/models/activity_finfee");

	var Activity_finfees = app.Collection.extend({
		url: '/activity_finfees/',
		model: Activity_finfeeModel
	});

	module.setExports(Activity_finfees);
});
