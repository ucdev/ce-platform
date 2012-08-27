/*! app/collections/sys_assessresultstatuses
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_assessresultstatuses
*/
define("app/collections/sys_assessresultstatuses",function(require,app) {
	var Sys_assessresultstatuModel = require("app/models/sys_assessresultstatu");

	app.collections.Sys_assessresultstatuses = app.Collection.extend({
		url: '/sys_assessresultstatuses/',
		model: Sys_assessresultstatuModel
	});

	exports.app = app;
});
