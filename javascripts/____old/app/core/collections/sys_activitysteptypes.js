/*! app/collections/sys_activitysteptypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_activitysteptypes
*/
define("app/collections/sys_activitysteptypes",function(require,app) {
	var Sys_activitysteptypeModel = require("app/models/sys_activitysteptype");

	app.collections.Sys_activitysteptypes = app.Collection.extend({
		url: '/sys_activitysteptypes/',
		model: Sys_activitysteptypeModel
	});

	exports.app = app;
});
