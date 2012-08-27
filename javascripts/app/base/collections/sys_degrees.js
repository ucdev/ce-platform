/*! app/collections/sys_degrees
* 	@requires: app,app/models/sys_degree
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_degrees
*/
define("app/collections/sys_degrees",["require","app","app/models"],function(require,app) {
	var Sys_degreeModel = require("app/models/sys_degree");

	var Sys_degrees = app.Collection.extend({
		url: '/sys_degrees/',
		model: Sys_degreeModel
	});

	module.setExports(Sys_degrees);
});
