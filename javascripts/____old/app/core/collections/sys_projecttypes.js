/*! app/collections/sys_projecttypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_projecttypes
*/
define("app/collections/sys_projecttypes",function(require,app) {
	var Sys_projecttypeModel = require("app/models/sys_projecttype");

	app.collections.Sys_projecttypes = app.Collection.extend({
		url: '/sys_projecttypes/',
		model: Sys_projecttypeModel
	});

	exports.app = app;
});
