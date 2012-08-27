/*! app/collections/sys_activitytypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_activitytypes
*/
define("app/collections/sys_activitytypes",function(require,app) {
	var Sys_activitytypeModel = require("app/models/sys_activitytype");

	app.collections.Sys_activitytypes = app.Collection.extend({
		url: '/sys_activitytypes/',
		model: Sys_activitytypeModel
	});

	exports.app = app;
});
