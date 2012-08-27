/*! app/collections/sys_funrcs
* 	@requires: app,app/models/sys_funrc
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_funrcs
*/
define("app/collections/sys_funrcs",["require","app","app/models"],function(require,app) {
	var Sys_funrcModel = require("app/models/sys_funrc");

	var Sys_funrcs = app.Collection.extend({
		url: '/sys_funrcs/',
		model: Sys_funrcModel
	});

	module.setExports(Sys_funrcs);
});
