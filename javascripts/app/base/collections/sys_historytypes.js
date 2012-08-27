/*! app/collections/sys_historytypes
* 	@requires: app,app/models/sys_historytype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_historytypes
*/
define("app/collections/sys_historytypes",["require","app","app/models"],function(require,app) {
	var Sys_historytypeModel = require("app/models/sys_historytype");

	var Sys_historytypes = app.Collection.extend({
		url: '/sys_historytypes/',
		model: Sys_historytypeModel
	});

	module.setExports(Sys_historytypes);
});
