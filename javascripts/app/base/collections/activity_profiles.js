/*! app/collections/activity_profiles
* 	@requires: app,app/models/activity_profile
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_profiles
*/
define("app/collections/activity_profiles",["require","app","app/models"],function(require,app) {
	var Activity_profileModel = require("app/models/activity_profile");

	var Activity_profiles = app.Collection.extend({
		url: '/activity_profiles/',
		model: Activity_profileModel
	});

	module.setExports(Activity_profiles);
});
