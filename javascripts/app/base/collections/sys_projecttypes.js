/*! app/collections/sys_projecttypes
* 	@requires: app,app/collection,app/models/sys_projecttype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_projecttypes
*/
define("app/collections/sys_projecttypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_projecttypeModel = require("app/models/sys_projecttype");
	
	Sys_projecttypes = AppCollection.extend({
		url: '/sys_projecttypes/',
		model: Sys_projecttypeModel
	});

	module.setExports(Sys_projecttypes);
});
