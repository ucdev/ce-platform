/*! app/collections/sys_specialtylms
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_specialtylms
*/
define("app/collections/sys_specialtylms",function(require,app) {
	var Sys_specialtylmModel = require("app/models/sys_specialtylm");

	app.collections.Sys_specialtylms = app.Collection.extend({
		url: '/sys_specialtylms/',
		model: Sys_specialtylmModel
	});

	exports.app = app;
});
