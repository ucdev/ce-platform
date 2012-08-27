/*! app/collections/sys_reports
* 	@requires: app,app/models/sys_report
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_reports
*/
define("app/collections/sys_reports",["require","app","app/models"],function(require,app) {
	var Sys_reportModel = require("app/models/sys_report");

	var Sys_reports = app.Collection.extend({
		url: '/sys_reports/',
		model: Sys_reportModel
	});

	module.setExports(Sys_reports);
});
