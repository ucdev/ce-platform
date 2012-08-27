/*! app/collections/sys_sitelms
* 	@requires: app,app/collection,app/models/sys_sitelm
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_sitelms
*/
define("app/collections/sys_sitelms",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_sitelmModel = require("app/models/sys_sitelm");
	
	Sys_sitelms = AppCollection.extend({
		url: '/sys_sitelms/',
		model: Sys_sitelmModel
	});

	module.setExports(Sys_sitelms);
});
