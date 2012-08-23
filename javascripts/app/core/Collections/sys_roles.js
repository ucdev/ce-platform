/*! app/core/collections/Sys_roles */
define("app/core/collections/Sys_roles",function() {
	var Sys_roles = Backbone.Collection.extend({
			url: '/sys_roles/',
			model: models.Sys_role
		});

	exports.Sys_roles = Sys_roles;
});
