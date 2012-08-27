/*! app/collections/sys_supporttypes
* 	@requires: app,app/collection,app/models/sys_supporttype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_supporttypes
*/
define("app/collections/sys_supporttypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_supporttypeModel = require("app/models/sys_supporttype");
	
	Sys_supporttypes = AppCollection.extend({
		url: '/sys_supporttypes/',
		model: Sys_supporttypeModel
	});

	module.setExports(Sys_supporttypes);
});
