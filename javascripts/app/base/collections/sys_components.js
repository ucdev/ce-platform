/*! app/collections/sys_components
* 	@requires: app,app/models/sys_component
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_components
*/
define("app/collections/sys_components",["require","app","app/models"],function(require,app) {
	var Sys_componentModel = require("app/models/sys_component");

	var Sys_components = app.Collection.extend({
		url: '/sys_components/',
		model: Sys_componentModel
	});

	module.setExports(Sys_components);
});
