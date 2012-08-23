/*! app/core/collections/Sys_stepstatuses */
define("app/core/collections/Sys_stepstatuses",function() {
	var Sys_stepstatuses = Backbone.Collection.extend({
			url: '/sys_stepstatuses/',
			model: models.Sys_stepstatu
		});

	exports.Sys_stepstatuses = Sys_stepstatuses;
});
