/*! app/collections/sys_testtypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_testtypes
*/
define("app/collections/sys_testtypes",function(require,app) {
	var Sys_testtypeModel = require("app/models/sys_testtype");

	app.collections.Sys_testtypes = app.Collection.extend({
		url: '/sys_testtypes/',
		model: Sys_testtypeModel
	});

	exports.app = app;
});
