/*! app/collections/sys_assessresultstatuses
* 	@requires: app,app/models/sys_assessresultstatu
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_assessresultstatuses
*/
define("app/collections/sys_assessresultstatuses",["require","app","app/models"],function(require,app) {
	var Sys_assessresultstatuModel = require("app/models/sys_assessresultstatu");

	var Sys_assessresultstatuses = app.Collection.extend({
		url: '/sys_assessresultstatuses/',
		model: Sys_assessresultstatuModel
	});

	module.setExports(Sys_assessresultstatuses);
});
