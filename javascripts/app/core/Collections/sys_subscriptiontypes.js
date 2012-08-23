/*! app/core/collections/Sys_subscriptiontypes */
define("app/core/collections/Sys_subscriptiontypes",function() {
	var Sys_subscriptiontypes = Backbone.Collection.extend({
			url: '/sys_subscriptiontypes/',
			model: models.Sys_subscriptiontype
		});

	exports.Sys_subscriptiontypes = Sys_subscriptiontypes;
});
