/*! app/collections/activity_profiles
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_profiles
*/
define("app/collections/activity_profiles",function(require,app) {
	var Activity_profileModel = require("app/models/activity_profile");

	app.collections.Activity_profiles = app.Collection.extend({
		url: '/activity_profiles/',
		model: Activity_profileModel
	});

	exports.app = app;
});
