/*! app/core/collections/Sys_degrees */
define("app/core/collections/Sys_degrees",function() {
	var Sys_degrees = Backbone.Collection.extend({
			url: '/sys_degrees/',
			model: models.Sys_degree
		});

	exports.Sys_degrees = Sys_degrees;
});
