/*! app/core/collections/Sys_cbofunds */
define("app/core/collections/Sys_cbofunds",function() {
	var Sys_cbofunds = Backbone.Collection.extend({
			url: '/sys_cbofunds/',
			model: models.Sys_cbofund
		});

	exports.Sys_cbofunds = Sys_cbofunds;
});
