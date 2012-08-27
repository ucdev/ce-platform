/*! app/collections/sys_funrcs
* 	@requires: app,app/collection,app/models/sys_funrc
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_funrcs
*/
define("app/collections/sys_funrcs",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_funrcModel = require("app/models/sys_funrc");
	
	Sys_funrcs = AppCollection.extend({
		url: '/sys_funrcs/',
		model: Sys_funrcModel
	});

	module.setExports(Sys_funrcs);
});
