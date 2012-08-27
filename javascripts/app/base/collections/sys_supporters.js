/*! app/collections/sys_supporters
* 	@requires: app,app/collection,app/models/sys_supporter
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_supporters
*/
define("app/collections/sys_supporters",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_supporterModel = require("app/models/sys_supporter");
	
	Sys_supporters = AppCollection.extend({
		url: '/sys_supporters/',
		model: Sys_supporterModel
	});

	module.setExports(Sys_supporters);
});
