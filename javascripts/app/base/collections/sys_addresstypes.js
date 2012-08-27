/*! app/collections/sys_addresstypes
* 	@requires: app,app/collection,app/models/sys_addresstype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_addresstypes
*/
define("app/collections/sys_addresstypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_addresstypeModel = require("app/models/sys_addresstype");
	
	Sys_addresstypes = AppCollection.extend({
		url: '/sys_addresstypes/',
		model: Sys_addresstypeModel
	});

	module.setExports(Sys_addresstypes);
});
