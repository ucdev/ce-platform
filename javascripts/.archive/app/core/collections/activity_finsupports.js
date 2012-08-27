/*! app/collections/activity_finsupports
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_finsupports
*/
define("app/collections/activity_finsupports",function(require,app) {
	var Activity_finsupportModel = require("app/models/activity_finsupport");

	app.collections.Activity_finsupports = app.Collection.extend({
		url: '/activity_finsupports/',
		model: Activity_finsupportModel
	});

	exports.app = app;
});
