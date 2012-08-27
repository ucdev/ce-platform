/*! app/collections/sys_stat_types
* 	@requires: app,app/models/sys_stat_type
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_stat_types
*/
define("app/collections/sys_stat_types",["require","app","app/models"],function(require,app) {
	var Sys_stat_typeModel = require("app/models/sys_stat_type");

	var Sys_stat_types = app.Collection.extend({
		url: '/sys_stat_types/',
		model: Sys_stat_typeModel
	});

	module.setExports(Sys_stat_types);
});
