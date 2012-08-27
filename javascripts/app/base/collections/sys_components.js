/*! app/collections/sys_components
* 	@requires: app,app/collection,app/models/sys_component
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_components
*/
define("app/collections/sys_components",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_componentModel = require("app/models/sys_component");
	
	Sys_components = AppCollection.extend({
		url: '/sys_components/',
		model: Sys_componentModel
	});

	module.setExports(Sys_components);
});
