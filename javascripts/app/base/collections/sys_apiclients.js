/*! app/collections/sys_apiclients
* 	@requires: app,app/collection,app/models/sys_apiclient
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_apiclients
*/
define("app/collections/sys_apiclients",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_apiclientModel = require("app/models/sys_apiclient");
	
	Sys_apiclients = AppCollection.extend({
		url: '/sys_apiclients/',
		model: Sys_apiclientModel
	});

	module.setExports(Sys_apiclients);
});
