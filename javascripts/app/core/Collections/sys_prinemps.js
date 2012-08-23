/*! app/core/collections/Sys_prinemps */
define("app/core/collections/Sys_prinemps",function() {
	var Sys_prinemps = Backbone.Collection.extend({
			url: '/sys_prinemps/',
			model: models.Sys_prinemp
		});

	exports.Sys_prinemps = Sys_prinemps;
});
