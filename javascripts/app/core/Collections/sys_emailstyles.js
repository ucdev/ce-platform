/*! app/core/collections/Sys_emailstyles */
define("app/core/collections/Sys_emailstyles",function() {
	var Sys_emailstyles = Backbone.Collection.extend({
			url: '/sys_emailstyles/',
			model: models.Sys_emailstyle
		});

	exports.Sys_emailstyles = Sys_emailstyles;
});
