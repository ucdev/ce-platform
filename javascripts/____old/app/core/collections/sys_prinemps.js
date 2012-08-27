/*! app/collections/sys_prinemps
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_prinemps
*/
define("app/collections/sys_prinemps",function(require,app) {
	var Sys_prinempModel = require("app/models/sys_prinemp");

	app.collections.Sys_prinemps = app.Collection.extend({
		url: '/sys_prinemps/',
		model: Sys_prinempModel
	});

	exports.app = app;
});
