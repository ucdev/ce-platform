/*! app/collections/sys_statuses
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_statuses
*/
define("app/collections/sys_statuses",function(require,app) {
	var Sys_statuModel = require("app/models/sys_statu");

	app.collections.Sys_statuses = app.Collection.extend({
		url: '/sys_statuses/',
		model: Sys_statuModel
	});

	exports.app = app;
});
