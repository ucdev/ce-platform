/*! app/collections/sys_roles
* 	@requires: app,app/collection,app/models/sys_role
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_roles
*/
define("app/collections/sys_roles",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_roleModel = require("app/models/sys_role");
	
	Sys_roles = AppCollection.extend({
		url: '/sys_roles/',
		model: Sys_roleModel
	});

	module.setExports(Sys_roles);
});
