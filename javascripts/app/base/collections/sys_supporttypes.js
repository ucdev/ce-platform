/*! app/collections/sys_supporttypes
* 	@requires: app,app/models/sys_supporttype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_supporttypes
*/
define("app/collections/sys_supporttypes",["require","app","app/models"],function(require,app) {
	var Sys_supporttypeModel = require("app/models/sys_supporttype");

	var Sys_supporttypes = app.Collection.extend({
		url: '/sys_supporttypes/',
		model: Sys_supporttypeModel
	});

	module.setExports(Sys_supporttypes);
});
