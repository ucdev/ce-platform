/*! app/collections/sys_apiclients
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_apiclients
*/
define("app/collections/sys_apiclients",function(require,app) {
	var Sys_apiclientModel = require("app/models/sys_apiclient");

	app.collections.Sys_apiclients = app.Collection.extend({
		url: '/sys_apiclients/',
		model: Sys_apiclientModel
	});

	exports.app = app;
});
