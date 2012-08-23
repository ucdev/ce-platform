/*! app/core/collections/Sys_orgtypes */
define("app/core/collections/Sys_orgtypes",function() {
	var Sys_orgtypes = Backbone.Collection.extend({
			url: '/sys_orgtypes/',
			model: models.Sys_orgtype
		});

	exports.Sys_orgtypes = Sys_orgtypes;
});
