/*! app/core/collections/Sys_grouptypes */
define("app/core/collections/Sys_grouptypes",function() {
	var Sys_grouptypes = Backbone.Collection.extend({
			url: '/sys_grouptypes/',
			model: models.Sys_grouptype
		});

	exports.Sys_grouptypes = Sys_grouptypes;
});
