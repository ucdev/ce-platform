/*! app/collections/sys_subscriptiontypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_subscriptiontypes
*/
define("app/collections/sys_subscriptiontypes",function(require,app) {
	var Sys_subscriptiontypeModel = require("app/models/sys_subscriptiontype");

	app.collections.Sys_subscriptiontypes = app.Collection.extend({
		url: '/sys_subscriptiontypes/',
		model: Sys_subscriptiontypeModel
	});

	exports.app = app;
});
