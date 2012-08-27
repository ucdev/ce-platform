/*! app/collections/sys_entrytypes
* 	@requires: app,app/collection,app/models/sys_entrytype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_entrytypes
*/
define("app/collections/sys_entrytypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_entrytypeModel = require("app/models/sys_entrytype");
	
	Sys_entrytypes = AppCollection.extend({
		url: '/sys_entrytypes/',
		model: Sys_entrytypeModel
	});

	module.setExports(Sys_entrytypes);
});
