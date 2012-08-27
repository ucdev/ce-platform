/*! app/collections/sys_historystyles
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_historystyles
*/
define("app/collections/sys_historystyles",function(require,app) {
	var Sys_historystyleModel = require("app/models/sys_historystyle");

	app.collections.Sys_historystyles = app.Collection.extend({
		url: '/sys_historystyles/',
		model: Sys_historystyleModel
	});

	exports.app = app;
});
