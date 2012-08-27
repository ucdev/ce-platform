/*! app/collections/sys_occclasses
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_occclasses
*/
define("app/collections/sys_occclasses",function(require,app) {
	var Sys_occclassModel = require("app/models/sys_occclass");

	app.collections.Sys_occclasses = app.Collection.extend({
		url: '/sys_occclasses/',
		model: Sys_occclassModel
	});

	exports.app = app;
});
