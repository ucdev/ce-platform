/*! app/core/collections/Sys_stat_log_types */
define("app/core/collections/Sys_stat_log_types",function() {
	var Sys_stat_log_types = Backbone.Collection.extend({
			url: '/sys_stat_log_types/',
			model: models.Sys_stat_log_type
		});

	exports.Sys_stat_log_types = Sys_stat_log_types;
});
