/*! app/collections/sys_activityroles
* 	@requires: app,app/collection,app/models/sys_activityrole
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_activityroles
*/
define("app/collections/sys_activityroles",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_activityroleModel = require("app/models/sys_activityrole");
	
	Sys_activityroles = AppCollection.extend({
		url: '/sys_activityroles/',
		model: Sys_activityroleModel
	});

	module.setExports(Sys_activityroles);
});
