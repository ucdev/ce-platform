/*! app/collections/sys_cbafunds
* 	@requires: app,app/collection,app/models/sys_cbafund
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_cbafunds
*/
define("app/collections/sys_cbafunds",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_cbafundModel = require("app/models/sys_cbafund");
	
	Sys_cbafunds = AppCollection.extend({
		url: '/sys_cbafunds/',
		model: Sys_cbafundModel
	});

	module.setExports(Sys_cbafunds);
});
