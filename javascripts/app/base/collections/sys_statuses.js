/*! app/collections/sys_statuses
* 	@requires: app,app/collection,app/models/sys_statu
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_statuses
*/
define("app/collections/sys_statuses",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_statuModel = require("app/models/sys_statu");
	
	Sys_statuses = AppCollection.extend({
		url: '/sys_statuses/',
		model: Sys_statuModel
	});

	module.setExports(Sys_statuses);
});
