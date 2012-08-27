/*! app/collections/sys_cbofunds
* 	@requires: app,app/collection,app/models/sys_cbofund
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_cbofunds
*/
define("app/collections/sys_cbofunds",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_cbofundModel = require("app/models/sys_cbofund");
	
	Sys_cbofunds = AppCollection.extend({
		url: '/sys_cbofunds/',
		model: Sys_cbofundModel
	});

	module.setExports(Sys_cbofunds);
});
