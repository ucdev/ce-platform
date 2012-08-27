/*! app/collections/sys_occclasses
* 	@requires: app,app/models/sys_occclass
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_occclasses
*/
define("app/collections/sys_occclasses",["require","app","app/models"],function(require,app) {
	var Sys_occclassModel = require("app/models/sys_occclass");

	var Sys_occclasses = app.Collection.extend({
		url: '/sys_occclasses/',
		model: Sys_occclassModel
	});

	module.setExports(Sys_occclasses);
});
