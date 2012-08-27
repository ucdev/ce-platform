/*! app/collections/sys_sitelms
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_sitelms
*/
define("app/collections/sys_sitelms",function(require,app) {
	var Sys_sitelmModel = require("app/models/sys_sitelm");

	app.collections.Sys_sitelms = app.Collection.extend({
		url: '/sys_sitelms/',
		model: Sys_sitelmModel
	});

	exports.app = app;
});
