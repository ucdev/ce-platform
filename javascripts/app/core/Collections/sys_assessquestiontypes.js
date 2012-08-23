/*! app/core/collections/Sys_assessquestiontypes */
define("app/core/collections/Sys_assessquestiontypes",function() {
	var Sys_assessquestiontypes = Backbone.Collection.extend({
			url: '/sys_assessquestiontypes/',
			model: models.Sys_assessquestiontype
		});

	exports.Sys_assessquestiontypes = Sys_assessquestiontypes;
});
