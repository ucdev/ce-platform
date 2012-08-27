/*! app/collections/sys_profcs
* 	@requires: app,app/collection,app/models/sys_profc
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_profcs
*/
define("app/collections/sys_profcs",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_profcModel = require("app/models/sys_profc");
	
	Sys_profcs = AppCollection.extend({
		url: '/sys_profcs/',
		model: Sys_profcModel
	});

	module.setExports(Sys_profcs);
});
