/*! app/collections/sys_profns
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_profns
*/
define("app/collections/sys_profns",function(require,app) {
	var Sys_profnModel = require("app/models/sys_profn");

	app.collections.Sys_profns = app.Collection.extend({
		url: '/sys_profns/',
		model: Sys_profnModel
	});

	exports.app = app;
});
