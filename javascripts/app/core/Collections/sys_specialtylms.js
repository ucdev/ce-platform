/*! app/core/collections/Sys_specialtylms */
define("app/core/collections/Sys_specialtylms",function() {
	var Sys_specialtylms = Backbone.Collection.extend({
			url: '/sys_specialtylms/',
			model: models.Sys_specialtylm
		});

	exports.Sys_specialtylms = Sys_specialtylms;
});
