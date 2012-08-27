/*! app/collections/sys_stat_log_types
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_stat_log_types
*/
define("app/collections/sys_stat_log_types",function(require,app) {
	var Sys_stat_log_typeModel = require("app/models/sys_stat_log_type");

	app.collections.Sys_stat_log_types = app.Collection.extend({
		url: '/sys_stat_log_types/',
		model: Sys_stat_log_typeModel
	});

	exports.app = app;
});
