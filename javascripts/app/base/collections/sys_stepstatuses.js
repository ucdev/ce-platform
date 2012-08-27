/*! app/collections/sys_stepstatuses
* 	@requires: app,app/models/sys_stepstatu
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_stepstatuses
*/
define("app/collections/sys_stepstatuses",["require","app","app/models"],function(require,app) {
	var Sys_stepstatuModel = require("app/models/sys_stepstatu");

	var Sys_stepstatuses = app.Collection.extend({
		url: '/sys_stepstatuses/',
		model: Sys_stepstatuModel
	});

	module.setExports(Sys_stepstatuses);
});
