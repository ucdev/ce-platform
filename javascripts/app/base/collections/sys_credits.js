/*! app/collections/sys_credits
* 	@requires: app,app/models/sys_credit
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_credits
*/
define("app/collections/sys_credits",["require","app","app/models"],function(require,app) {
	var Sys_creditModel = require("app/models/sys_credit");

	var Sys_credits = app.Collection.extend({
		url: '/sys_credits/',
		model: Sys_creditModel
	});

	module.setExports(Sys_credits);
});
