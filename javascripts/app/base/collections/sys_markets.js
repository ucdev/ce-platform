/*! app/collections/sys_markets
* 	@requires: app,app/collection,app/models/sys_market
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_markets
*/
define("app/collections/sys_markets",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_marketModel = require("app/models/sys_market");
	
	Sys_markets = AppCollection.extend({
		url: '/sys_markets/',
		model: Sys_marketModel
	});

	module.setExports(Sys_markets);
});
