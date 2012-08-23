/*! app/core/collections/Sys_activitysteptypes */
define("app/core/collections/Sys_activitysteptypes",function() {
	var Sys_activitysteptypes = Backbone.Collection.extend({
			url: '/sys_activitysteptypes/',
			model: models.Sys_activitysteptype
		});

	exports.Sys_activitysteptypes = Sys_activitysteptypes;
});
