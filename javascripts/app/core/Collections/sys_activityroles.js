/*! app/core/collections/Sys_activityroles */
define("app/core/collections/Sys_activityroles",function() {
	var Sys_activityroles = Backbone.Collection.extend({
			url: '/sys_activityroles/',
			model: models.Sys_activityrole
		});

	exports.Sys_activityroles = Sys_activityroles;
});
