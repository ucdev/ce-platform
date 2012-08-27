/*! app/collections/sys_ethnicities
* 	@requires: app,app/models/sys_ethnicity
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_ethnicities
*/
define("app/collections/sys_ethnicities",["require","app","app/models"],function(require,app) {
	var Sys_ethnicityModel = require("app/models/sys_ethnicity");

	var Sys_ethnicities = app.Collection.extend({
		url: '/sys_ethnicities/',
		model: Sys_ethnicityModel
	});

	module.setExports(Sys_ethnicities);
});
