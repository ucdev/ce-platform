/*! app/collections/sys_stat_log_types
* 	@requires: app,app/collection,app/models/sys_stat_log_type
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_stat_log_types
*/
define("app/collections/sys_stat_log_types",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_stat_log_typeModel = require("app/models/sys_stat_log_type");
	
	Sys_stat_log_types = AppCollection.extend({
		url: '/sys_stat_log_types/',
		model: Sys_stat_log_typeModel
	});

	module.setExports(Sys_stat_log_types);
});
