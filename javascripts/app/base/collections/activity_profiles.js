/*! app/collections/activity_profiles
* 	@requires: app,app/collection,app/models/activity_profile
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_profiles
*/
define("app/collections/activity_profiles",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_profileModel = require("app/models/activity_profile");
	
	Activity_profiles = AppCollection.extend({
		url: '/activity_profiles/',
		model: Activity_profileModel
	});

	module.setExports(Activity_profiles);
});
