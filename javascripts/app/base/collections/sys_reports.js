/*! app/collections/sys_reports
* 	@requires: app,app/collection,app/models/sys_report
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_reports
*/
define("app/collections/sys_reports",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_reportModel = require("app/models/sys_report");
	
	Sys_reports = AppCollection.extend({
		url: '/sys_reports/',
		model: Sys_reportModel
	});

	module.setExports(Sys_reports);
});
