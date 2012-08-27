/*! app/collections/sys_supporters
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_supporters
*/
define("app/collections/sys_supporters",function(require,app) {
	var Sys_supporterModel = require("app/models/sys_supporter");

	app.collections.Sys_supporters = app.Collection.extend({
		url: '/sys_supporters/',
		model: Sys_supporterModel
	});

	exports.app = app;
});
