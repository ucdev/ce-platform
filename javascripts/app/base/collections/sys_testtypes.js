/*! app/collections/sys_testtypes
* 	@requires: app,app/models/sys_testtype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_testtypes
*/
define("app/collections/sys_testtypes",["require","app","app/models"],function(require,app) {
	var Sys_testtypeModel = require("app/models/sys_testtype");

	var Sys_testtypes = app.Collection.extend({
		url: '/sys_testtypes/',
		model: Sys_testtypeModel
	});

	module.setExports(Sys_testtypes);
});
