/*! app/collections/activity_pubcomponents
* 	@requires: app,app/models/activity_pubcomponent
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_pubcomponents
*/
define("app/collections/activity_pubcomponents",["require","app","app/models"],function(require,app) {
	var Activity_pubcomponentModel = require("app/models/activity_pubcomponent");

	var Activity_pubcomponents = app.Collection.extend({
		url: '/activity_pubcomponents/',
		model: Activity_pubcomponentModel
	});

	module.setExports(Activity_pubcomponents);
});
