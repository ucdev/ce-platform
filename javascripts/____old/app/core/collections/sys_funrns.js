/*! app/collections/sys_funrns
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_funrns
*/
define("app/collections/sys_funrns",function(require,app) {
	var Sys_funrnModel = require("app/models/sys_funrn");

	app.collections.Sys_funrns = app.Collection.extend({
		url: '/sys_funrns/',
		model: Sys_funrnModel
	});

	exports.app = app;
});
