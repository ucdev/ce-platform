/*! app/collections/activity_users
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_users
*/
define("app/collections/activity_users",function(require,app) {
	var Activity_userModel = require("app/models/activity_user");

	app.collections.Activity_users = app.Collection.extend({
		url: '/activity_users/',
		model: Activity_userModel
	});

	exports.app = app;
});
