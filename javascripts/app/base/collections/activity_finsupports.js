/*! app/collections/activity_finsupports
* 	@requires: app,app/models/activity_finsupport
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_finsupports
*/
define("app/collections/activity_finsupports",["require","app","app/models"],function(require,app) {
	var Activity_finsupportModel = require("app/models/activity_finsupport");

	var Activity_finsupports = app.Collection.extend({
		url: '/activity_finsupports/',
		model: Activity_finsupportModel
	});

	module.setExports(Activity_finsupports);
});
