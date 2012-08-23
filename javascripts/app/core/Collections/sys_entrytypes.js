/*! app/core/collections/Sys_entrytypes */
define("app/core/collections/Sys_entrytypes",function() {
	var Sys_entrytypes = Backbone.Collection.extend({
			url: '/sys_entrytypes/',
			model: models.Sys_entrytype
		});

	exports.Sys_entrytypes = Sys_entrytypes;
});
