/*! app/collections/sys_subscriptiontypes
* 	@requires: app,app/models/sys_subscriptiontype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_subscriptiontypes
*/
define("app/collections/sys_subscriptiontypes",["require","app","app/models"],function(require,app) {
	var Sys_subscriptiontypeModel = require("app/models/sys_subscriptiontype");

	var Sys_subscriptiontypes = app.Collection.extend({
		url: '/sys_subscriptiontypes/',
		model: Sys_subscriptiontypeModel
	});

	module.setExports(Sys_subscriptiontypes);
});
