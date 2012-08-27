/*! app/collections/activity_finsupports
* 	@requires: app,app/collection,app/models/activity_finsupport
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_finsupports
*/
define("app/collections/activity_finsupports",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_finsupportModel = require("app/models/activity_finsupport");
	
	Activity_finsupports = AppCollection.extend({
		url: '/activity_finsupports/',
		model: Activity_finsupportModel
	});

	module.setExports(Activity_finsupports);
});
