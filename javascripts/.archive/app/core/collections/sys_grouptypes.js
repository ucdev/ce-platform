/*! app/collections/sys_grouptypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_grouptypes
*/
define("app/collections/sys_grouptypes",function(require,app) {
	var Sys_grouptypeModel = require("app/models/sys_grouptype");

	app.collections.Sys_grouptypes = app.Collection.extend({
		url: '/sys_grouptypes/',
		model: Sys_grouptypeModel
	});

	exports.app = app;
});
