/*! app/collections/sys_projecttypes
* 	@requires: app,app/models/sys_projecttype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_projecttypes
*/
define("app/collections/sys_projecttypes",["require","app","app/models"],function(require,app) {
	var Sys_projecttypeModel = require("app/models/sys_projecttype");

	var Sys_projecttypes = app.Collection.extend({
		url: '/sys_projecttypes/',
		model: Sys_projecttypeModel
	});

	module.setExports(Sys_projecttypes);
});
