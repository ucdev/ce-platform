/*! app/collections/sys_activityroles
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_activityroles
*/
define("app/collections/sys_activityroles",function(require,app) {
	var Sys_activityroleModel = require("app/models/sys_activityrole");

	app.collections.Sys_activityroles = app.Collection.extend({
		url: '/sys_activityroles/',
		model: Sys_activityroleModel
	});

	exports.app = app;
});
