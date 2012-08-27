/*! app/collections/sys_stat_types
* 	@requires: app,app/collection,app/models/sys_stat_type
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_stat_types
*/
define("app/collections/sys_stat_types",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_stat_typeModel = require("app/models/sys_stat_type");
	
	Sys_stat_types = AppCollection.extend({
		url: '/sys_stat_types/',
		model: Sys_stat_typeModel
	});

	module.setExports(Sys_stat_types);
});
