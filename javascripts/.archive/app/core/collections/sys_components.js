/*! app/collections/sys_components
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_components
*/
define("app/collections/sys_components",function(require,app) {
	var Sys_componentModel = require("app/models/sys_component");

	app.collections.Sys_components = app.Collection.extend({
		url: '/sys_components/',
		model: Sys_componentModel
	});

	exports.app = app;
});
