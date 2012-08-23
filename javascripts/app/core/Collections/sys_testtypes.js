/*! app/core/collections/Sys_testtypes */
define("app/core/collections/Sys_testtypes",function() {
	var Sys_testtypes = Backbone.Collection.extend({
			url: '/sys_testtypes/',
			model: models.Sys_testtype
		});

	exports.Sys_testtypes = Sys_testtypes;
});
