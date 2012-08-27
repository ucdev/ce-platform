/*! app/collections/sys_ethnicities
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_ethnicities
*/
define("app/collections/sys_ethnicities",function(require,app) {
	var Sys_ethnicityModel = require("app/models/sys_ethnicity");

	app.collections.Sys_ethnicities = app.Collection.extend({
		url: '/sys_ethnicities/',
		model: Sys_ethnicityModel
	});

	exports.app = app;
});
