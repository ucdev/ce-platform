/*! app/collections/sys_cbofunds
* 	@requires: app,app/models/sys_cbofund
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_cbofunds
*/
define("app/collections/sys_cbofunds",["require","app","app/models"],function(require,app) {
	var Sys_cbofundModel = require("app/models/sys_cbofund");

	var Sys_cbofunds = app.Collection.extend({
		url: '/sys_cbofunds/',
		model: Sys_cbofundModel
	});

	module.setExports(Sys_cbofunds);
});
