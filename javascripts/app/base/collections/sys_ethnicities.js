/*! app/collections/sys_ethnicities
* 	@requires: app,app/collection,app/models/sys_ethnicity
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_ethnicities
*/
define("app/collections/sys_ethnicities",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_ethnicityModel = require("app/models/sys_ethnicity");
	
	Sys_ethnicities = AppCollection.extend({
		url: '/sys_ethnicities/',
		model: Sys_ethnicityModel
	});

	module.setExports(Sys_ethnicities);
});
