/*! app/collections/sys_occclasses
* 	@requires: app,app/collection,app/models/sys_occclass
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_occclasses
*/
define("app/collections/sys_occclasses",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_occclassModel = require("app/models/sys_occclass");
	
	Sys_occclasses = AppCollection.extend({
		url: '/sys_occclasses/',
		model: Sys_occclassModel
	});

	module.setExports(Sys_occclasses);
});
