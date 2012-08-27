/*! app/collections/sys_attendeestatuses
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_attendeestatuses
*/
define("app/collections/sys_attendeestatuses",function(require,app) {
	var Sys_attendeestatuModel = require("app/models/sys_attendeestatu");

	app.collections.Sys_attendeestatuses = app.Collection.extend({
		url: '/sys_attendeestatuses/',
		model: Sys_attendeestatuModel
	});

	exports.app = app;
});
