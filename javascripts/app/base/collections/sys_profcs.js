/*! app/collections/sys_profcs
* 	@requires: app,app/models/sys_profc
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_profcs
*/
define("app/collections/sys_profcs",["require","app","app/models"],function(require,app) {
	var Sys_profcModel = require("app/models/sys_profc");

	var Sys_profcs = app.Collection.extend({
		url: '/sys_profcs/',
		model: Sys_profcModel
	});

	module.setExports(Sys_profcs);
});
