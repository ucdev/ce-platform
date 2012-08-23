/*! app/core/collections/Sys_reports */
define("app/core/collections/Sys_reports",function() {
	var Sys_reports = Backbone.Collection.extend({
			url: '/sys_reports/',
			model: models.Sys_report
		});

	exports.Sys_reports = Sys_reports;
});
