/*! app/collections/sys_activitysteptypes
* 	@requires: app,app/collection,app/models/sys_activitysteptype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_activitysteptypes
*/
define("app/collections/sys_activitysteptypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_activitysteptypeModel = require("app/models/sys_activitysteptype");
	
	Sys_activitysteptypes = AppCollection.extend({
		url: '/sys_activitysteptypes/',
		model: Sys_activitysteptypeModel
	});

	module.setExports(Sys_activitysteptypes);
});
