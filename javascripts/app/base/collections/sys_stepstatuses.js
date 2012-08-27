/*! app/collections/sys_stepstatuses
* 	@requires: app,app/collection,app/models/sys_stepstatu
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_stepstatuses
*/
define("app/collections/sys_stepstatuses",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_stepstatuModel = require("app/models/sys_stepstatu");
	
	Sys_stepstatuses = AppCollection.extend({
		url: '/sys_stepstatuses/',
		model: Sys_stepstatuModel
	});

	module.setExports(Sys_stepstatuses);
});
