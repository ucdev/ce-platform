/*! app/core/collections/Sys_activitytypes */
define("app/core/collections/Sys_activitytypes",function() {
	var Sys_activitytypes = Backbone.Collection.extend({
			url: '/sys_activitytypes/',
			model: models.Sys_activitytype
		});

	exports.Sys_activitytypes = Sys_activitytypes;
});
