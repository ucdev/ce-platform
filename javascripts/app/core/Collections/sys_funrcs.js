/*! app/core/collections/Sys_funrcs */
define("app/core/collections/Sys_funrcs",function() {
	var Sys_funrcs = Backbone.Collection.extend({
			url: '/sys_funrcs/',
			model: models.Sys_funrc
		});

	exports.Sys_funrcs = Sys_funrcs;
});
