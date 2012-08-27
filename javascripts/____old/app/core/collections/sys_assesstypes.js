/*! app/collections/sys_assesstypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_assesstypes
*/
define("app/collections/sys_assesstypes",function(require,app) {
	var Sys_assesstypeModel = require("app/models/sys_assesstype");

	app.collections.Sys_assesstypes = app.Collection.extend({
		url: '/sys_assesstypes/',
		model: Sys_assesstypeModel
	});

	exports.app = app;
});
