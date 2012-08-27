/*! app/collections/sys_personstatuses
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_personstatuses
*/
define("app/collections/sys_personstatuses",function(require,app) {
	var Sys_personstatuModel = require("app/models/sys_personstatu");

	app.collections.Sys_personstatuses = app.Collection.extend({
		url: '/sys_personstatuses/',
		model: Sys_personstatuModel
	});

	exports.app = app;
});
