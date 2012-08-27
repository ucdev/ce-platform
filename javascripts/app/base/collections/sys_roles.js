/*! app/collections/sys_roles
* 	@requires: app,app/models/sys_role
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_roles
*/
define("app/collections/sys_roles",["require","app","app/models"],function(require,app) {
	var Sys_roleModel = require("app/models/sys_role");

	var Sys_roles = app.Collection.extend({
		url: '/sys_roles/',
		model: Sys_roleModel
	});

	module.setExports(Sys_roles);
});
