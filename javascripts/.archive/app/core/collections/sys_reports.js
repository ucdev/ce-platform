/*! app/collections/sys_reports
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_reports
*/
define("app/collections/sys_reports",function(require,app) {
	var Sys_reportModel = require("app/models/sys_report");

	app.collections.Sys_reports = app.Collection.extend({
		url: '/sys_reports/',
		model: Sys_reportModel
	});

	exports.app = app;
});
