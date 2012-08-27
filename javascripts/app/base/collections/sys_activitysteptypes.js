/*! app/collections/sys_activitysteptypes
* 	@requires: app,app/models/sys_activitysteptype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_activitysteptypes
*/
define("app/collections/sys_activitysteptypes",["require","app","app/models"],function(require,app) {
	var Sys_activitysteptypeModel = require("app/models/sys_activitysteptype");

	var Sys_activitysteptypes = app.Collection.extend({
		url: '/sys_activitysteptypes/',
		model: Sys_activitysteptypeModel
	});

	module.setExports(Sys_activitysteptypes);
});
