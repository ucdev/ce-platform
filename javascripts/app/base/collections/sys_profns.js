/*! app/collections/sys_profns
* 	@requires: app,app/models/sys_profn
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_profns
*/
define("app/collections/sys_profns",["require","app","app/models"],function(require,app) {
	var Sys_profnModel = require("app/models/sys_profn");

	var Sys_profns = app.Collection.extend({
		url: '/sys_profns/',
		model: Sys_profnModel
	});

	module.setExports(Sys_profns);
});
