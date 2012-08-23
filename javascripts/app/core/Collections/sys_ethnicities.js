/*! app/core/collections/Sys_ethnicities */
define("app/core/collections/Sys_ethnicities",function() {
	var Sys_ethnicities = Backbone.Collection.extend({
			url: '/sys_ethnicities/',
			model: models.Sys_ethnicity
		});

	exports.Sys_ethnicities = Sys_ethnicities;
});
