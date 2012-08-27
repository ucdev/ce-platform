/*! app/collections/sys_supporters
* 	@requires: app,app/models/sys_supporter
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_supporters
*/
define("app/collections/sys_supporters",["require","app","app/models"],function(require,app) {
	var Sys_supporterModel = require("app/models/sys_supporter");

	var Sys_supporters = app.Collection.extend({
		url: '/sys_supporters/',
		model: Sys_supporterModel
	});

	module.setExports(Sys_supporters);
});
