/*! app/collections/sys_historytypes
* 	@requires: app,app/collection,app/models/sys_historytype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_historytypes
*/
define("app/collections/sys_historytypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_historytypeModel = require("app/models/sys_historytype");
	
	Sys_historytypes = AppCollection.extend({
		url: '/sys_historytypes/',
		model: Sys_historytypeModel
	});

	module.setExports(Sys_historytypes);
});
