/*! app/collections/sys_groupings
* 	@requires: app,app/collection,app/models/sys_grouping
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_groupings
*/
define("app/collections/sys_groupings",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_groupingModel = require("app/models/sys_grouping");
	
	Sys_groupings = AppCollection.extend({
		url: '/sys_groupings/',
		model: Sys_groupingModel
	});

	module.setExports(Sys_groupings);
});
