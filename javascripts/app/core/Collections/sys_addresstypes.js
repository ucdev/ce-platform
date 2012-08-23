/*! app/core/collections/Sys_addresstypes */
define("app/core/collections/Sys_addresstypes",function() {
	var Sys_addresstypes = Backbone.Collection.extend({
			url: '/sys_addresstypes/',
			model: models.Sys_addresstype
		});

	exports.Sys_addresstypes = Sys_addresstypes;
});
