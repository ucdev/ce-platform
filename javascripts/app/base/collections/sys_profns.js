/*! app/collections/sys_profns
* 	@requires: app,app/collection,app/models/sys_profn
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_profns
*/
define("app/collections/sys_profns",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_profnModel = require("app/models/sys_profn");
	
	Sys_profns = AppCollection.extend({
		url: '/sys_profns/',
		model: Sys_profnModel
	});

	module.setExports(Sys_profns);
});
