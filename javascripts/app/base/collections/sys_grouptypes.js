/*! app/collections/sys_grouptypes
* 	@requires: app,app/models/sys_grouptype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_grouptypes
*/
define("app/collections/sys_grouptypes",["require","app","app/models"],function(require,app) {
	var Sys_grouptypeModel = require("app/models/sys_grouptype");

	var Sys_grouptypes = app.Collection.extend({
		url: '/sys_grouptypes/',
		model: Sys_grouptypeModel
	});

	module.setExports(Sys_grouptypes);
});
