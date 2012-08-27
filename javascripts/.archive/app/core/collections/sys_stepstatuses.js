/*! app/collections/sys_stepstatuses
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_stepstatuses
*/
define("app/collections/sys_stepstatuses",function(require,app) {
	var Sys_stepstatuModel = require("app/models/sys_stepstatu");

	app.collections.Sys_stepstatuses = app.Collection.extend({
		url: '/sys_stepstatuses/',
		model: Sys_stepstatuModel
	});

	exports.app = app;
});
