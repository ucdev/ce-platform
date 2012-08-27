/*! app/collections/sys_apiclients
* 	@requires: app,app/models/sys_apiclient
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_apiclients
*/
define("app/collections/sys_apiclients",["require","app","app/models"],function(require,app) {
	var Sys_apiclientModel = require("app/models/sys_apiclient");

	var Sys_apiclients = app.Collection.extend({
		url: '/sys_apiclients/',
		model: Sys_apiclientModel
	});

	module.setExports(Sys_apiclients);
});
