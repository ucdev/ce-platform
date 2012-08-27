/*! app/collections/sys_historytypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_historytypes
*/
define("app/collections/sys_historytypes",function(require,app) {
	var Sys_historytypeModel = require("app/models/sys_historytype");

	app.collections.Sys_historytypes = app.Collection.extend({
		url: '/sys_historytypes/',
		model: Sys_historytypeModel
	});

	exports.app = app;
});
