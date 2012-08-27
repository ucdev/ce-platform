/*! app/collections/sys_supporttypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_supporttypes
*/
define("app/collections/sys_supporttypes",function(require,app) {
	var Sys_supporttypeModel = require("app/models/sys_supporttype");

	app.collections.Sys_supporttypes = app.Collection.extend({
		url: '/sys_supporttypes/',
		model: Sys_supporttypeModel
	});

	exports.app = app;
});
