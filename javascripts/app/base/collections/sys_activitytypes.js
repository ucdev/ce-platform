/*! app/collections/sys_activitytypes
* 	@requires: app,app/collection,app/models/sys_activitytype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_activitytypes
*/
define("app/collections/sys_activitytypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_activitytypeModel = require("app/models/sys_activitytype");
	
	Sys_activitytypes = AppCollection.extend({
		url: '/sys_activitytypes/',
		model: Sys_activitytypeModel
	});

	module.setExports(Sys_activitytypes);
});
