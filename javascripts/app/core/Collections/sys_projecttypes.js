/*! app/core/collections/Sys_projecttypes */
define("app/core/collections/Sys_projecttypes",function() {
	var Sys_projecttypes = Backbone.Collection.extend({
			url: '/sys_projecttypes/',
			model: models.Sys_projecttype
		});

	exports.Sys_projecttypes = Sys_projecttypes;
});
