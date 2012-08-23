/*! app/core/collections/Sys_supporttypes */
define("app/core/collections/Sys_supporttypes",function() {
	var Sys_supporttypes = Backbone.Collection.extend({
			url: '/sys_supporttypes/',
			model: models.Sys_supporttype
		});

	exports.Sys_supporttypes = Sys_supporttypes;
});
