/*! app/collections/sys_cbafunds
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_cbafunds
*/
define("app/collections/sys_cbafunds",function(require,app) {
	var Sys_cbafundModel = require("app/models/sys_cbafund");

	app.collections.Sys_cbafunds = app.Collection.extend({
		url: '/sys_cbafunds/',
		model: Sys_cbafundModel
	});

	exports.app = app;
});
