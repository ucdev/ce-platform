/*! app/collections/sys_degrees
* 	@requires: app,app/collection,app/models/sys_degree
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_degrees
*/
define("app/collections/sys_degrees",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_degreeModel = require("app/models/sys_degree");
	
	Sys_degrees = AppCollection.extend({
		url: '/sys_degrees/',
		model: Sys_degreeModel
	});

	module.setExports(Sys_degrees);
});
