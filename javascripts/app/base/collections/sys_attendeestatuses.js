/*! app/collections/sys_attendeestatuses
* 	@requires: app,app/models/sys_attendeestatu
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_attendeestatuses
*/
define("app/collections/sys_attendeestatuses",["require","app","app/models"],function(require,app) {
	var Sys_attendeestatuModel = require("app/models/sys_attendeestatu");

	var Sys_attendeestatuses = app.Collection.extend({
		url: '/sys_attendeestatuses/',
		model: Sys_attendeestatuModel
	});

	module.setExports(Sys_attendeestatuses);
});
