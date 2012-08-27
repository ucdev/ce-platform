/*! app/collections/sys_cbafunds
* 	@requires: app,app/models/sys_cbafund
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_cbafunds
*/
define("app/collections/sys_cbafunds",["require","app","app/models"],function(require,app) {
	var Sys_cbafundModel = require("app/models/sys_cbafund");

	var Sys_cbafunds = app.Collection.extend({
		url: '/sys_cbafunds/',
		model: Sys_cbafundModel
	});

	module.setExports(Sys_cbafunds);
});
