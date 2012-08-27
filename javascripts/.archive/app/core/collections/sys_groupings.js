/*! app/collections/sys_groupings
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_groupings
*/
define("app/collections/sys_groupings",function(require,app) {
	var Sys_groupingModel = require("app/models/sys_grouping");

	app.collections.Sys_groupings = app.Collection.extend({
		url: '/sys_groupings/',
		model: Sys_groupingModel
	});

	exports.app = app;
});
