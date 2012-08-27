/*! app/collections/sys_groupings
* 	@requires: app,app/models/sys_grouping
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_groupings
*/
define("app/collections/sys_groupings",["require","app","app/models"],function(require,app) {
	var Sys_groupingModel = require("app/models/sys_grouping");

	var Sys_groupings = app.Collection.extend({
		url: '/sys_groupings/',
		model: Sys_groupingModel
	});

	module.setExports(Sys_groupings);
});
