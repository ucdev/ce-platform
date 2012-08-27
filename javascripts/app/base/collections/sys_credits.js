/*! app/collections/sys_credits
* 	@requires: app,app/collection,app/models/sys_credit
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_credits
*/
define("app/collections/sys_credits",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_creditModel = require("app/models/sys_credit");
	
	Sys_credits = AppCollection.extend({
		url: '/sys_credits/',
		model: Sys_creditModel
	});

	module.setExports(Sys_credits);
});
