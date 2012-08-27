/*! app/collections/activity_users
* 	@requires: app,app/models/activity_user
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_users
*/
define("app/collections/activity_users",["require","app","app/models"],function(require,app) {
	var Activity_userModel = require("app/models/activity_user");

	var Activity_users = app.Collection.extend({
		url: '/activity_users/',
		model: Activity_userModel
	});

	module.setExports(Activity_users);
});
