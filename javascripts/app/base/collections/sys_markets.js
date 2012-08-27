/*! app/collections/sys_markets
* 	@requires: app,app/models/sys_market
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_markets
*/
define("app/collections/sys_markets",["require","app","app/models"],function(require,app) {
	var Sys_marketModel = require("app/models/sys_market");

	var Sys_markets = app.Collection.extend({
		url: '/sys_markets/',
		model: Sys_marketModel
	});

	module.setExports(Sys_markets);
});
