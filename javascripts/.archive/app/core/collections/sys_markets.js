/*! app/collections/sys_markets
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_markets
*/
define("app/collections/sys_markets",function(require,app) {
	var Sys_marketModel = require("app/models/sys_market");

	app.collections.Sys_markets = app.Collection.extend({
		url: '/sys_markets/',
		model: Sys_marketModel
	});

	exports.app = app;
});
