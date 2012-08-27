/*! app/collections/sys_assesstypes
* 	@requires: app,app/collection,app/models/sys_assesstype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_assesstypes
*/
define("app/collections/sys_assesstypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_assesstypeModel = require("app/models/sys_assesstype");
	
	Sys_assesstypes = AppCollection.extend({
		url: '/sys_assesstypes/',
		model: Sys_assesstypeModel
	});

	module.setExports(Sys_assesstypes);
});
