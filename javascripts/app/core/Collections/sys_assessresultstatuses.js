/*! app/core/collections/Sys_assessresultstatuses */
define("app/core/collections/Sys_assessresultstatuses",function() {
	var Sys_assessresultstatuses = Backbone.Collection.extend({
			url: '/sys_assessresultstatuses/',
			model: models.Sys_assessresultstatu
		});

	exports.Sys_assessresultstatuses = Sys_assessresultstatuses;
});
