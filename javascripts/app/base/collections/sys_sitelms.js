/*! app/collections/sys_sitelms
* 	@requires: app,app/models/sys_sitelm
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_sitelms
*/
define("app/collections/sys_sitelms",["require","app","app/models"],function(require,app) {
	var Sys_sitelmModel = require("app/models/sys_sitelm");

	var Sys_sitelms = app.Collection.extend({
		url: '/sys_sitelms/',
		model: Sys_sitelmModel
	});

	module.setExports(Sys_sitelms);
});
