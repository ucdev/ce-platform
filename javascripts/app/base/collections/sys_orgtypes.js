/*! app/collections/sys_orgtypes
* 	@requires: app,app/collection,app/models/sys_orgtype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_orgtypes
*/
define("app/collections/sys_orgtypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_orgtypeModel = require("app/models/sys_orgtype");
	
	Sys_orgtypes = AppCollection.extend({
		url: '/sys_orgtypes/',
		model: Sys_orgtypeModel
	});

	module.setExports(Sys_orgtypes);
});
