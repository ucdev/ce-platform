/*! app/collections/sys_addresstypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_addresstypes
*/
define("app/collections/sys_addresstypes",function(require,app) {
	var Sys_addresstypeModel = require("app/models/sys_addresstype");

	app.collections.Sys_addresstypes = app.Collection.extend({
		url: '/sys_addresstypes/',
		model: Sys_addresstypeModel
	});

	exports.app = app;
});
