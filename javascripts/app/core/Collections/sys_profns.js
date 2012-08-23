/*! app/core/collections/Sys_profns */
define("app/core/collections/Sys_profns",function() {
	var Sys_profns = Backbone.Collection.extend({
			url: '/sys_profns/',
			model: models.Sys_profn
		});

	exports.Sys_profns = Sys_profns;
});
