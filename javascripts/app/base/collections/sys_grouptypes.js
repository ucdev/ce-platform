/*! app/collections/sys_grouptypes
* 	@requires: app,app/collection,app/models/sys_grouptype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_grouptypes
*/
define("app/collections/sys_grouptypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_grouptypeModel = require("app/models/sys_grouptype");
	
	Sys_grouptypes = AppCollection.extend({
		url: '/sys_grouptypes/',
		model: Sys_grouptypeModel
	});

	module.setExports(Sys_grouptypes);
});
