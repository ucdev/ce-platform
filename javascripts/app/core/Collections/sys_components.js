/*! app/core/collections/Sys_components */
define("app/core/collections/Sys_components",function() {
	var Sys_components = Backbone.Collection.extend({
			url: '/sys_components/',
			model: models.Sys_component
		});

	exports.Sys_components = Sys_components;
});
