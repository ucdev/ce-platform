/*! app/collections/sys_assessquestiontypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_assessquestiontypes
*/
define("app/collections/sys_assessquestiontypes",function(require,app) {
	var Sys_assessquestiontypeModel = require("app/models/sys_assessquestiontype");

	app.collections.Sys_assessquestiontypes = app.Collection.extend({
		url: '/sys_assessquestiontypes/',
		model: Sys_assessquestiontypeModel
	});

	exports.app = app;
});
