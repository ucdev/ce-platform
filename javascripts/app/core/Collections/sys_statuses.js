/*! app/core/collections/Sys_statuses */
define("app/core/collections/Sys_statuses",function() {
	var Sys_statuses = Backbone.Collection.extend({
			url: '/sys_statuses/',
			model: models.Sys_statu
		});

	exports.Sys_statuses = Sys_statuses;
});
