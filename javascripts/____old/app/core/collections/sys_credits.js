/*! app/collections/sys_credits
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_credits
*/
define("app/collections/sys_credits",function(require,app) {
	var Sys_creditModel = require("app/models/sys_credit");

	app.collections.Sys_credits = app.Collection.extend({
		url: '/sys_credits/',
		model: Sys_creditModel
	});

	exports.app = app;
});
