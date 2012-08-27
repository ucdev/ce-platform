/*! app/collections/sys_stat_types
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_stat_types
*/
define("app/collections/sys_stat_types",function(require,app) {
	var Sys_stat_typeModel = require("app/models/sys_stat_type");

	app.collections.Sys_stat_types = app.Collection.extend({
		url: '/sys_stat_types/',
		model: Sys_stat_typeModel
	});

	exports.app = app;
});
