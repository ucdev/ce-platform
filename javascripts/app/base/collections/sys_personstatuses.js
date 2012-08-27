/*! app/collections/sys_personstatuses
* 	@requires: app,app/models/sys_personstatu
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_personstatuses
*/
define("app/collections/sys_personstatuses",["require","app","app/models"],function(require,app) {
	var Sys_personstatuModel = require("app/models/sys_personstatu");

	var Sys_personstatuses = app.Collection.extend({
		url: '/sys_personstatuses/',
		model: Sys_personstatuModel
	});

	module.setExports(Sys_personstatuses);
});
