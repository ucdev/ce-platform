/*! app/core/collections/Sys_assesstypes */
define("app/core/collections/Sys_assesstypes",function() {
	var Sys_assesstypes = Backbone.Collection.extend({
			url: '/sys_assesstypes/',
			model: models.Sys_assesstype
		});

	exports.Sys_assesstypes = Sys_assesstypes;
});
