/*! app/core/collections/Sys_markets */
define("app/core/collections/Sys_markets",function() {
	var Sys_markets = Backbone.Collection.extend({
			url: '/sys_markets/',
			model: models.Sys_market
		});

	exports.Sys_markets = Sys_markets;
});
