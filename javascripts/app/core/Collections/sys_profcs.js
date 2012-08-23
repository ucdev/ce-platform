/*! app/core/collections/Sys_profcs */
define("app/core/collections/Sys_profcs",function() {
	var Sys_profcs = Backbone.Collection.extend({
			url: '/sys_profcs/',
			model: models.Sys_profc
		});

	exports.Sys_profcs = Sys_profcs;
});
