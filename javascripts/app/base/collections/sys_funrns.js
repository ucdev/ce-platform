/*! app/collections/sys_funrns
* 	@requires: app,app/collection,app/models/sys_funrn
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_funrns
*/
define("app/collections/sys_funrns",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_funrnModel = require("app/models/sys_funrn");
	
	Sys_funrns = AppCollection.extend({
		url: '/sys_funrns/',
		model: Sys_funrnModel
	});

	module.setExports(Sys_funrns);
});
