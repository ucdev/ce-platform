/*! app/core/collections/Sys_groupings */
define("app/core/collections/Sys_groupings",function() {
	var Sys_groupings = Backbone.Collection.extend({
			url: '/sys_groupings/',
			model: models.Sys_grouping
		});

	exports.Sys_groupings = Sys_groupings;
});
