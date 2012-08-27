/*! app/collections/sys_activityroles
* 	@requires: app,app/models/sys_activityrole
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_activityroles
*/
define("app/collections/sys_activityroles",["require","app","app/models"],function(require,app) {
	var Sys_activityroleModel = require("app/models/sys_activityrole");

	var Sys_activityroles = app.Collection.extend({
		url: '/sys_activityroles/',
		model: Sys_activityroleModel
	});

	module.setExports(Sys_activityroles);
});
