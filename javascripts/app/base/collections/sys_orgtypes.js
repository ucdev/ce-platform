/*! app/collections/sys_orgtypes
* 	@requires: app,app/models/sys_orgtype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_orgtypes
*/
define("app/collections/sys_orgtypes",["require","app","app/models"],function(require,app) {
	var Sys_orgtypeModel = require("app/models/sys_orgtype");

	var Sys_orgtypes = app.Collection.extend({
		url: '/sys_orgtypes/',
		model: Sys_orgtypeModel
	});

	module.setExports(Sys_orgtypes);
});
