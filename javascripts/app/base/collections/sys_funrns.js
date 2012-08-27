/*! app/collections/sys_funrns
* 	@requires: app,app/models/sys_funrn
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_funrns
*/
define("app/collections/sys_funrns",["require","app","app/models"],function(require,app) {
	var Sys_funrnModel = require("app/models/sys_funrn");

	var Sys_funrns = app.Collection.extend({
		url: '/sys_funrns/',
		model: Sys_funrnModel
	});

	module.setExports(Sys_funrns);
});
