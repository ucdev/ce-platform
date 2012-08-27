/*! app/collections/sys_prinemps
* 	@requires: app,app/collection,app/models/sys_prinemp
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_prinemps
*/
define("app/collections/sys_prinemps",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_prinempModel = require("app/models/sys_prinemp");
	
	Sys_prinemps = AppCollection.extend({
		url: '/sys_prinemps/',
		model: Sys_prinempModel
	});

	module.setExports(Sys_prinemps);
});
