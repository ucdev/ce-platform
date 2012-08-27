/*! app/collections/sys_profcs
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_profcs
*/
define("app/collections/sys_profcs",function(require,app) {
	var Sys_profcModel = require("app/models/sys_profc");

	app.collections.Sys_profcs = app.Collection.extend({
		url: '/sys_profcs/',
		model: Sys_profcModel
	});

	exports.app = app;
});
