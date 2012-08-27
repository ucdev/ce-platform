/*! app/collections/sys_roles
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_roles
*/
define("app/collections/sys_roles",function(require,app) {
	var Sys_roleModel = require("app/models/sys_role");

	app.collections.Sys_roles = app.Collection.extend({
		url: '/sys_roles/',
		model: Sys_roleModel
	});

	exports.app = app;
});
