/*! app/collections/sys_prinemps
* 	@requires: app,app/models/sys_prinemp
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_prinemps
*/
define("app/collections/sys_prinemps",["require","app","app/models"],function(require,app) {
	var Sys_prinempModel = require("app/models/sys_prinemp");

	var Sys_prinemps = app.Collection.extend({
		url: '/sys_prinemps/',
		model: Sys_prinempModel
	});

	module.setExports(Sys_prinemps);
});
