/*! app/collections/sys_funrcs
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_funrcs
*/
define("app/collections/sys_funrcs",function(require,app) {
	var Sys_funrcModel = require("app/models/sys_funrc");

	app.collections.Sys_funrcs = app.Collection.extend({
		url: '/sys_funrcs/',
		model: Sys_funrcModel
	});

	exports.app = app;
});
