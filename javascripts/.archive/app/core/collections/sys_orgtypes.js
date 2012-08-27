/*! app/collections/sys_orgtypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_orgtypes
*/
define("app/collections/sys_orgtypes",function(require,app) {
	var Sys_orgtypeModel = require("app/models/sys_orgtype");

	app.collections.Sys_orgtypes = app.Collection.extend({
		url: '/sys_orgtypes/',
		model: Sys_orgtypeModel
	});

	exports.app = app;
});
