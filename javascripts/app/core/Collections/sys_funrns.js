/*! app/core/collections/Sys_funrns */
define("app/core/collections/Sys_funrns",function() {
	var Sys_funrns = Backbone.Collection.extend({
			url: '/sys_funrns/',
			model: models.Sys_funrn
		});

	exports.Sys_funrns = Sys_funrns;
});
