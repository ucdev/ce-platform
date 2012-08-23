/*! app/core/collections/Sys_sitelms */
define("app/core/collections/Sys_sitelms",function() {
	var Sys_sitelms = Backbone.Collection.extend({
			url: '/sys_sitelms/',
			model: models.Sys_sitelm
		});

	exports.Sys_sitelms = Sys_sitelms;
});
