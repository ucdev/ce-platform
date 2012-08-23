/*! app/core/collections/Sys_historytypes */
define("app/core/collections/Sys_historytypes",function() {
	var Sys_historytypes = Backbone.Collection.extend({
			url: '/sys_historytypes/',
			model: models.Sys_historytype
		});

	exports.Sys_historytypes = Sys_historytypes;
});
