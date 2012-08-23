/*! app/core/collections/Sys_stat_types */
define("app/core/collections/Sys_stat_types",function() {
	var Sys_stat_types = Backbone.Collection.extend({
			url: '/sys_stat_types/',
			model: models.Sys_stat_type
		});

	exports.Sys_stat_types = Sys_stat_types;
});
