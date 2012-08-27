/*! app/collections/sys_attendeestatuses
* 	@requires: app,app/collection,app/models/sys_attendeestatu
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_attendeestatuses
*/
define("app/collections/sys_attendeestatuses",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_attendeestatuModel = require("app/models/sys_attendeestatu");
	
	Sys_attendeestatuses = AppCollection.extend({
		url: '/sys_attendeestatuses/',
		model: Sys_attendeestatuModel
	});

	module.setExports(Sys_attendeestatuses);
});
