/*! app/collections/sys_testtypes
* 	@requires: app,app/collection,app/models/sys_testtype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_testtypes
*/
define("app/collections/sys_testtypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_testtypeModel = require("app/models/sys_testtype");
	
	Sys_testtypes = AppCollection.extend({
		url: '/sys_testtypes/',
		model: Sys_testtypeModel
	});

	module.setExports(Sys_testtypes);
});
