/*! app/collections/sys_specialtylms
* 	@requires: app,app/models/sys_specialtylm
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_specialtylms
*/
define("app/collections/sys_specialtylms",["require","app","app/models"],function(require,app) {
	var Sys_specialtylmModel = require("app/models/sys_specialtylm");

	var Sys_specialtylms = app.Collection.extend({
		url: '/sys_specialtylms/',
		model: Sys_specialtylmModel
	});

	module.setExports(Sys_specialtylms);
});
