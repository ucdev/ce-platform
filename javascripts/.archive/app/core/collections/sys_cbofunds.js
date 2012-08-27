/*! app/collections/sys_cbofunds
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_cbofunds
*/
define("app/collections/sys_cbofunds",function(require,app) {
	var Sys_cbofundModel = require("app/models/sys_cbofund");

	app.collections.Sys_cbofunds = app.Collection.extend({
		url: '/sys_cbofunds/',
		model: Sys_cbofundModel
	});

	exports.app = app;
});
