/*! app/collections/sys_assessresultstatuses
* 	@requires: app,app/collection,app/models/sys_assessresultstatu
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_assessresultstatuses
*/
define("app/collections/sys_assessresultstatuses",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_assessresultstatuModel = require("app/models/sys_assessresultstatu");
	
	Sys_assessresultstatuses = AppCollection.extend({
		url: '/sys_assessresultstatuses/',
		model: Sys_assessresultstatuModel
	});

	module.setExports(Sys_assessresultstatuses);
});
