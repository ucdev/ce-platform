/*! app/collections/activity_users
* 	@requires: app,app/collection,app/models/activity_user
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_users
*/
define("app/collections/activity_users",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_userModel = require("app/models/activity_user");
	
	Activity_users = AppCollection.extend({
		url: '/activity_users/',
		model: Activity_userModel
	});

	module.setExports(Activity_users);
});
