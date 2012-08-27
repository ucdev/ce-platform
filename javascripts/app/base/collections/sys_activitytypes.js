/*! app/collections/sys_activitytypes
* 	@requires: app,app/models/sys_activitytype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_activitytypes
*/
define("app/collections/sys_activitytypes",["require","app","app/models"],function(require,app) {
	var Sys_activitytypeModel = require("app/models/sys_activitytype");

	var Sys_activitytypes = app.Collection.extend({
		url: '/sys_activitytypes/',
		model: Sys_activitytypeModel
	});

	module.setExports(Sys_activitytypes);
});
