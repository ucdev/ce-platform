/*! app/collections/sys_personstatuses
* 	@requires: app,app/collection,app/models/sys_personstatu
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_personstatuses
*/
define("app/collections/sys_personstatuses",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_personstatuModel = require("app/models/sys_personstatu");
	
	Sys_personstatuses = AppCollection.extend({
		url: '/sys_personstatuses/',
		model: Sys_personstatuModel
	});

	module.setExports(Sys_personstatuses);
});
