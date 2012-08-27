/*! app/collections/sys_assesstypes
* 	@requires: app,app/models/sys_assesstype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_assesstypes
*/
define("app/collections/sys_assesstypes",["require","app","app/models"],function(require,app) {
	var Sys_assesstypeModel = require("app/models/sys_assesstype");

	var Sys_assesstypes = app.Collection.extend({
		url: '/sys_assesstypes/',
		model: Sys_assesstypeModel
	});

	module.setExports(Sys_assesstypes);
});
