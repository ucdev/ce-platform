/*! app/core/collections/Sys_supporters */
define("app/core/collections/Sys_supporters",function() {
	var Sys_supporters = Backbone.Collection.extend({
			url: '/sys_supporters/',
			model: models.Sys_supporter
		});

	exports.Sys_supporters = Sys_supporters;
});
