/*! app/core/collections/Sys_credits */
define("app/core/collections/Sys_credits",function() {
	var Sys_credits = Backbone.Collection.extend({
			url: '/sys_credits/',
			model: models.Sys_credit
		});

	exports.Sys_credits = Sys_credits;
});
