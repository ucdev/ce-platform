/*! app/core/collections/Sys_historystyles */
define("app/core/collections/Sys_historystyles",function() {
	var Sys_historystyles = Backbone.Collection.extend({
			url: '/sys_historystyles/',
			model: models.Sys_historystyle
		});

	exports.Sys_historystyles = Sys_historystyles;
});
