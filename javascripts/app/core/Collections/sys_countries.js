/*! app/core/collections/Sys_countries */
define("app/core/collections/Sys_countries",function() {
	var Sys_countries = Backbone.Collection.extend({
			url: '/sys_countries/',
			model: models.Sys_country
		});

	exports.Sys_countries = Sys_countries;
});
