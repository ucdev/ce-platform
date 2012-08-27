/*! app/collections/sys_degrees
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_degrees
*/
define("app/collections/sys_degrees",function(require,app) {
	var Sys_degreeModel = require("app/models/sys_degree");

	app.collections.Sys_degrees = app.Collection.extend({
		url: '/sys_degrees/',
		model: Sys_degreeModel
	});

	exports.app = app;
});
