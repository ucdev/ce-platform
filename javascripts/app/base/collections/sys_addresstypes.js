/*! app/collections/sys_addresstypes
* 	@requires: app,app/models/sys_addresstype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_addresstypes
*/
define("app/collections/sys_addresstypes",["require","app","app/models"],function(require,app) {
	var Sys_addresstypeModel = require("app/models/sys_addresstype");

	var Sys_addresstypes = app.Collection.extend({
		url: '/sys_addresstypes/',
		model: Sys_addresstypeModel
	});

	module.setExports(Sys_addresstypes);
});
