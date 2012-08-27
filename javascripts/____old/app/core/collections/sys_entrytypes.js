/*! app/collections/sys_entrytypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_entrytypes
*/
define("app/collections/sys_entrytypes",function(require,app) {
	var Sys_entrytypeModel = require("app/models/sys_entrytype");

	app.collections.Sys_entrytypes = app.Collection.extend({
		url: '/sys_entrytypes/',
		model: Sys_entrytypeModel
	});

	exports.app = app;
});
