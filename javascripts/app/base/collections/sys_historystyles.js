/*! app/collections/sys_historystyles
* 	@requires: app,app/models/sys_historystyle
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_historystyles
*/
define("app/collections/sys_historystyles",["require","app","app/models"],function(require,app) {
	var Sys_historystyleModel = require("app/models/sys_historystyle");

	var Sys_historystyles = app.Collection.extend({
		url: '/sys_historystyles/',
		model: Sys_historystyleModel
	});

	module.setExports(Sys_historystyles);
});
