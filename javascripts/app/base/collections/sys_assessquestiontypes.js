/*! app/collections/sys_assessquestiontypes
* 	@requires: app,app/models/sys_assessquestiontype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_assessquestiontypes
*/
define("app/collections/sys_assessquestiontypes",["require","app","app/models"],function(require,app) {
	var Sys_assessquestiontypeModel = require("app/models/sys_assessquestiontype");

	var Sys_assessquestiontypes = app.Collection.extend({
		url: '/sys_assessquestiontypes/',
		model: Sys_assessquestiontypeModel
	});

	module.setExports(Sys_assessquestiontypes);
});
