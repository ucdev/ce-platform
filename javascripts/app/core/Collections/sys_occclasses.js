/*! app/core/collections/Sys_occclasses */
define("app/core/collections/Sys_occclasses",function() {
	var Sys_occclasses = Backbone.Collection.extend({
			url: '/sys_occclasses/',
			model: models.Sys_occclass
		});

	exports.Sys_occclasses = Sys_occclasses;
});
