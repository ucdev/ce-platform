/*! app/collections/sys_subscriptiontypes
* 	@requires: app,app/collection,app/models/sys_subscriptiontype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_subscriptiontypes
*/
define("app/collections/sys_subscriptiontypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_subscriptiontypeModel = require("app/models/sys_subscriptiontype");
	
	Sys_subscriptiontypes = AppCollection.extend({
		url: '/sys_subscriptiontypes/',
		model: Sys_subscriptiontypeModel
	});

	module.setExports(Sys_subscriptiontypes);
});
