/*! app/core/collections/Sys_apiclients */
define("app/core/collections/Sys_apiclients",function() {
	var Sys_apiclients = Backbone.Collection.extend({
			url: '/sys_apiclients/',
			model: models.Sys_apiclient
		});

	exports.Sys_apiclients = Sys_apiclients;
});
