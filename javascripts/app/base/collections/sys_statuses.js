/*! app/collections/sys_statuses
* 	@requires: app,app/models/sys_statu
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_statuses
*/
define("app/collections/sys_statuses",["require","app","app/models"],function(require,app) {
	var Sys_statuModel = require("app/models/sys_statu");

	var Sys_statuses = app.Collection.extend({
		url: '/sys_statuses/',
		model: Sys_statuModel
	});

	module.setExports(Sys_statuses);
});
