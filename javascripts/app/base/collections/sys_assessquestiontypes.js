/*! app/collections/sys_assessquestiontypes
* 	@requires: app,app/collection,app/models/sys_assessquestiontype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_assessquestiontypes
*/
define("app/collections/sys_assessquestiontypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_assessquestiontypeModel = require("app/models/sys_assessquestiontype");
	
	Sys_assessquestiontypes = AppCollection.extend({
		url: '/sys_assessquestiontypes/',
		model: Sys_assessquestiontypeModel
	});

	module.setExports(Sys_assessquestiontypes);
});
