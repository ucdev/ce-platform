/*! app/collections/sys_specialtylms
* 	@requires: app,app/collection,app/models/sys_specialtylm
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_specialtylms
*/
define("app/collections/sys_specialtylms",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_specialtylmModel = require("app/models/sys_specialtylm");
	
	Sys_specialtylms = AppCollection.extend({
		url: '/sys_specialtylms/',
		model: Sys_specialtylmModel
	});

	module.setExports(Sys_specialtylms);
});
