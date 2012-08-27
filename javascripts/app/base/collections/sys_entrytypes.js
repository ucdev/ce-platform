/*! app/collections/sys_entrytypes
* 	@requires: app,app/models/sys_entrytype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_entrytypes
*/
define("app/collections/sys_entrytypes",["require","app","app/models"],function(require,app) {
	var Sys_entrytypeModel = require("app/models/sys_entrytype");

	var Sys_entrytypes = app.Collection.extend({
		url: '/sys_entrytypes/',
		model: Sys_entrytypeModel
	});

	module.setExports(Sys_entrytypes);
});
