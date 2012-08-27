/*! app/collections/sys_historystyles
* 	@requires: app,app/collection,app/models/sys_historystyle
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_historystyles
*/
define("app/collections/sys_historystyles",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_historystyleModel = require("app/models/sys_historystyle");
	
	Sys_historystyles = AppCollection.extend({
		url: '/sys_historystyles/',
		model: Sys_historystyleModel
	});

	module.setExports(Sys_historystyles);
});
