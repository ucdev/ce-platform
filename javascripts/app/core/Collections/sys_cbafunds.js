/*! app/core/collections/Sys_cbafunds */
define("app/core/collections/Sys_cbafunds",function() {
	var Sys_cbafunds = Backbone.Collection.extend({
			url: '/sys_cbafunds/',
			model: models.Sys_cbafund
		});

	exports.Sys_cbafunds = Sys_cbafunds;
});
