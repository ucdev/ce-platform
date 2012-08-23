/*! app/core/collections/Sys_personstatuses */
define("app/core/collections/Sys_personstatuses",function() {
	var Sys_personstatuses = Backbone.Collection.extend({
			url: '/sys_personstatuses/',
			model: models.Sys_personstatu
		});

	exports.Sys_personstatuses = Sys_personstatuses;
});
