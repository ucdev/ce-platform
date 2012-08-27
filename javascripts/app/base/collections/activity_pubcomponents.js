/*! app/collections/activity_pubcomponents
* 	@requires: app,app/collection,app/models/activity_pubcomponent
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_pubcomponents
*/
define("app/collections/activity_pubcomponents",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_pubcomponentModel = require("app/models/activity_pubcomponent");
	
	Activity_pubcomponents = AppCollection.extend({
		url: '/activity_pubcomponents/',
		model: Activity_pubcomponentModel
	});

	module.setExports(Activity_pubcomponents);
});
